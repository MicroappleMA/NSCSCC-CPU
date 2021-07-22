`timescale 1ns / 1ps

module Sim1();
    reg CLK;
    reg RST;


    // Top top(
    //     .CLK(CLK),
    //     .RST(RST)
    // );

    always #1 CLK=~CLK;
    initial begin
        CLK=0;RST=1;#10;
        RST=0;
    end
    
    wire [31:0]PC_IF;
    wire [31:0]Inst_IF;

    IF If(
        .CLK(CLK),
        .RST(RST),
        .PCSrc1(PCSrc_MEM),
        .inPC1(PC_EX_MEM),
        .PCSrc2(PCSrcForward_ID),
        .inPC2(PC_ID),

        .outPC(PC_IF),
        .Inst(Inst_IF)
    );

    wire [31:0]PC_IF_ID;
    wire [31:0]Inst_IF_ID;

    IF_ID if_id(
        .CLK(~CLK),
        .RST(RST),
        .inPC(PC_IF),
        .inInst(Inst_IF),

        .outPC(PC_IF_ID),
        .outInst(Inst_IF_ID)
    );

    wire [31:0]PC_ID;
    wire [31:0]RDataA_ID;
    wire [31:0]RDataB_ID;
    wire [31:0]imm32_ID;
    wire [4:0]rt_ID;
    wire [4:0]rd_ID;
    wire [4:0]shamt_ID;
    wire RegWrite_ID;
    wire PCSrc_ID;
    wire PCSrcForward_ID;
    wire MemWrite_ID;
    wire MemtoReg_ID;
    wire ALUSrc1_ID;
    wire ALUSrc2_ID;
    wire [11:0]ALUOP_ID;
    wire RegDst_ID;
    wire [5:0]BranchType_ID;

    ID id(
        .CLK(CLK),
        .RST(RST), 
        .inRegWrite(RegWrite_MEM_WB),
        .Inst(Inst_IF_ID),
        .WAddr(WAddr_MEM_WB),
        .WData(WData_WB),
        .inPC(PC_IF_ID),

        .outPC(PC_ID),
        .RDataA(RDataA_ID),
        .RDataB(RDataB_ID),
        .imm32(imm32_ID),
        .rt(rt_ID),
        .rd(rd_ID),
        .shamt(shamt_ID),
        .RegWrite(RegWrite_ID),
        .PCSrc(PCSrc_ID),
        .PCSrcForward(PCSrcForward_ID),
        .MemWrite(MemWrite_ID),
        .MemtoReg(MemtoReg_ID),
        .ALUSrc1(ALUSrc1_ID),
        .ALUSrc2(ALUSrc2_ID),
        .ALUOP(ALUOP_ID),
        .RegDst(RegDst_ID),
        .BranchType(BranchType_ID)
    );

    wire [31:0]RDataA_ID_EX;
    wire [31:0]RDataB_ID_EX;
    wire [31:0]imm32_ID_EX;
    wire [4:0]rt_ID_EX;
    wire [4:0]rd_ID_EX;
    wire [4:0]shamt_ID_EX;
    wire RegWrite_ID_EX;
    wire PCSrc_ID_EX;
    wire MemWrite_ID_EX;
    wire MemtoReg_ID_EX;
    wire ALUSrc1_ID_EX;
    wire ALUSrc2_ID_EX;
    wire [11:0]ALUOP_ID_EX;
    wire RegDst_ID_EX;
    wire [5:0]BranchType_ID_EX;
    wire [31:0]PC_ID_EX;

    ID_EX id_ex(
        .CLK(~CLK),
        .RST(RST),
        .inRDataA(RDataA_ID),
        .inRDataB(RDataB_ID),
        .inimm32(imm32_ID),
        .inrt(rt_ID),
        .inrd(rd_ID),
        .inshamt(shamt_ID),
        .inRegWrite(RegWrite_ID),
        .inPCSrc(PCSrc_ID),
        .inMemWrite(MemWrite_ID),
        .inMemtoReg(MemtoReg_ID),
        .inALUSrc1(ALUSrc1_ID),
        .inALUSrc2(ALUSrc2_ID),
        .inALUOP(ALUOP_ID),
        .inRegDst(RegDst_ID),
        .inBranchType(BranchType_ID),
        .inPC(PC_IF_ID),

        .outRDataA(RDataA_ID_EX),
        .outRDataB(RDataB_ID_EX),
        .outimm32(imm32_ID_EX),
        .outrt(rt_ID_EX),
        .outrd(rd_ID_EX),
        .outshamt(shamt_ID_EX),
        .outRegWrite(RegWrite_ID_EX),
        .outPCSrc(PCSrc_ID_EX),
        .outMemWrite(MemWrite_ID_EX),
        .outMemtoReg(MemtoReg_ID_EX),
        .outALUSrc1(ALUSrc1_ID_EX),
        .outALUSrc2(ALUSrc2_ID_EX),
        .outALUOP(ALUOP_ID_EX),
        .outRegDst(RegDst_ID_EX),
        .outBranchType(BranchType_ID_EX),
        .outPC(PC_ID_EX)
    );

    wire [4:0]WAddr_EX;
    wire [31:0]ALURes_EX;
    wire CF_EX;
    wire OF_EX;
    wire SF_EX;
    wire ZF_EX;
    wire [31:0]PC_EX;

    EX ex(
        .ALUSrc1(ALUSrc1_ID_EX),
        .ALUSrc2(ALUSrc2_ID_EX),
        .ALUOP(ALUOP_ID_EX),
        .RegDst(RegDst_ID_EX),
        .inPC(PC_ID_EX),
        .RDataA(RDataA_ID_EX),
        .RDataB(RDataB_ID_EX),
        .imm32(imm32_ID_EX),
        .rt(rt_ID_EX),
        .rd(rd_ID_EX),
        .shamt(shamt_ID_EX),

        .WAddr(WAddr_EX),
        .ALURes(ALURes_EX),
        .CF(CF_EX),
        .OF(OF_EX),
        .SF(SF_EX),
        .ZF(ZF_EX),
        .outPC(PC_EX)
    );

    wire [31:0]PC_EX_MEM;
    wire [31:0]ALURes_EX_MEM;
    wire CF_EX_MEM;
    wire OF_EX_MEM;
    wire SF_EX_MEM;
    wire ZF_EX_MEM;
    wire [31:0]MemWData_EX_MEM;
    wire [4:0]WAddr_EX_MEM;
    wire RegWrite_EX_MEM;
    wire PCSrc_EX_MEM;
    wire MemWrite_EX_MEM;
    wire MemtoReg_EX_MEM;
    wire [5:0]BranchType_EX_MEM;


    EX_MEM ex_mem(
        .CLK(~CLK),
        .RST(RST),
        .inPC(PC_EX),
        .inALURes(ALURes_EX),
        .inCF(CF_EX),
        .inOF(OF_EX),
        .inSF(SF_EX),
        .inZF(ZF_EX),
        .inMemWData(RDataB_ID_EX),
        .inWAddr(WAddr_EX),
        .inRegWrite(RegWrite_ID_EX),
        .inPCSrc(PCSrc_ID_EX),
        .inMemWrite(MemWrite_ID_EX),
        .inMemtoReg(MemtoReg_ID_EX),
        .inBranchType(BranchType_ID_EX),

        .outPC(PC_EX_MEM),
        .outALURes(ALURes_EX_MEM),
        .outCF(CF_EX_MEM),
        .outOF(OF_EX_MEM),
        .outSF(SF_EX_MEM),
        .outZF(ZF_EX_MEM),
        .outMemWData(MemWData_EX_MEM),
        .outWAddr(WAddr_EX_MEM),
        .outRegWrite(RegWrite_EX_MEM),
        .outPCSrc(PCSrc_EX_MEM),
        .outMemWrite(MemWrite_EX_MEM),
        .outMemtoReg(MemtoReg_EX_MEM),
        .outBranchType(BranchType_EX_MEM)
    );

    wire [31:0]MemRData_MEM;
    wire PCSrc_MEM;

    MEM mem(
        .CLK(CLK),
        .ALURes(ALURes_EX_MEM),
        .CF(CF_EX_MEM),
        .OF(OF_EX_MEM),
        .SF(SF_EX_MEM),
        .ZF(ZF_EX_MEM),
        .MemWData(MemWData_EX_MEM),
        .inPCSrc(PCSrc_EX_MEM),
        .MemWrite(MemWrite_EX_MEM),
        .BranchType(BranchType_EX_MEM),

        .MemRData(MemRData_MEM),
        .outPCSrc(PCSrc_MEM)
    );

    wire [31:0]MemRData_MEM_WB;
    wire [31:0]ALURes_MEM_WB;
    wire RegWrite_MEM_WB;
    wire MemtoReg_MEM_WB;
    wire [4:0]WAddr_MEM_WB;

    MEM_WB mem_wb(
        .CLK(~CLK),
        .RST(RST),
        .inMemRData(MemRData_MEM),
        .inALURes(ALURes_EX_MEM),
        .inRegWrite(RegWrite_EX_MEM),
        .inMemtoReg(MemtoReg_EX_MEM),
        .inWAddr(WAddr_EX_MEM),

        .outMemRData(MemRData_MEM_WB),
        .outALURes(ALURes_MEM_WB),
        .outRegWrite(RegWrite_MEM_WB),
        .outMemtoReg(MemtoReg_MEM_WB),
        .outWAddr(WAddr_MEM_WB)
    );

    wire [31:0]WData_WB;

    WB wb(
        .MemtoReg(MemtoReg_MEM_WB),
        .MemRData(MemRData_MEM_WB),
        .ALURes(ALURes_MEM_WB),

        .WData(WData_WB)
    );

endmodule


