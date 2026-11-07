`timescale 1ns / 1ps
module executeTB();
    reg clk;
    reg [1:0] ctlwb_in, ctlm_in;
    reg [31:0] npc, rdata1, rdata2, s_extend;
    reg [4:0] instr_2016, instr_1511;
    reg [1:0] alu_op;
    reg [5:0] funct;
    reg alusrc, regdst;

    wire [1:0] ctlwb_out, ctlm_out;
    wire [31:0] adder_out, alu_result_out, rdata2_out;
    wire [4:0] muxout_out;

    execute uut (
        .wb_ctl(ctlwb_in),
        .m_ctl(ctlm_in),
        .npcout(npc),
        .rdata1(rdata1),
        .rdata2(rdata2),
        .s_extendout(s_extend),
        .instrout_2016(instr_2016),
        .instrout_1511(instr_1511),
        .aluop(alu_op),
        .alusrc(alusrc),
        .regdst(regdst),
        .wb_ctlout(ctlwb_out),
        .alu_result(alu_result_out),
        .rdata2out(rdata2_out),
        .five_bit_muxout(muxout_out)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Initialize inputs
        ctlwb_in = 2'b10; ctlm_in = 2'b01;
        npc = 32'd100; rdata1 = 32'd10; rdata2 = 32'd20; s_extend = 32'd4;
        instr_2016 = 5'd5; instr_1511 = 5'd10;
        alu_op = 2'b10; funct = 6'b100000;
        alusrc = 1; regdst = 1;

        #15;

        // Modify inputs to test different scenarios
        alusrc = 0; regdst = 0;
        s_extend = 32'd8;
        alu_op = 2'b01; funct = 6'b100010;
        
        #15;
        
        // Add function with Rdata1 = 4, Rdata2 = 12
        //ALU_result should be 12
        s_extend = 32'h0000000020;
        rdata1 = 32'h0000000c;
        rdata2 = 32'h00000004;
        alu_op = 2'b10;
        alusrc = 1'b0;
        funct = 6'b100000;
        
        #15;
        
        //Subtract with 12 and 4
        funct = 6'b100010;
        s_extend = 32'h0000000022;
        
        #15;
        
        //slt with 12 and 4
        funct = 6'b101010;
        s_extend = 32'h000000002a;
        
        #15;
        
        //AND 
        rdata1 = 32'b00000000000000001111111111111111;
        rdata2 = 32'b01010101010101010101010101010101;
        funct = 6'b100100;
        s_extend = 32'h0000000024;
        
        #15;
        
        //OR 
        funct = 6'b100101;
        s_extend = 32'h0000000025;
        
        #15;
        

        $stop;
    end
endmodule