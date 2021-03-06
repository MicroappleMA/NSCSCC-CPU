`timescale 1ns / 1ps

module ID2(
    input [5:0]opcode,
    input [5:0]funct,
    input [31:0]RDataA,
    input [25:0]JumpTarget,
    input [31:0]inPC,
    input [4:0]rs,
    input [4:0]rt,
    output reg RegWrite,
    output reg MemWrite,
    output reg MemtoReg,
    output reg ExtratoReg,
    output reg HIWrite,
    output reg LOWrite,
    output reg HILOWrite,
    output reg PCSrc,
    output reg PCSrcForward,
    output reg ALUSrc1,
    output reg [1:0]ALUSrc2,
    output reg [11:0]ALUOP,
    output reg [3:0]MDUOP,
    output reg [1:0]RegDst,
    output reg SignExt,
    output reg [2:0]ExtraDataSrc,
    output reg [31:0]outPC,
    output reg [5:0]BranchType,
    output reg [1:0]MemSize,
    output reg MemSignExt,
    output reg [1:0]RDataValid,
    output reg MTC0,
    output reg ERET,
    output reg [4:0]ExcCode,
    output reg CP0toReg
    );

    always @(*) begin
        case (opcode)
        6'b000000: //R
        begin 
            MemWrite<=0;MemtoReg<=0;SignExt<=0;PCSrc<=0;outPC<=RDataA;BranchType<=6'b0;MemSize<=2'h0;MemSignExt<=0;MTC0<=0;ERET<=0;CP0toReg<=0;
            case (funct)
                6'b100000:begin ALUOP<=12'b000000000001;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;ExcCode<=5'b11111; end   //add
                6'b100001:begin ALUOP<=12'b000000000001;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;ExcCode<=5'b11111; end   //addu
                6'b100010:begin ALUOP<=12'b000000000010;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;ExcCode<=5'b11111; end   //sub
                6'b100011:begin ALUOP<=12'b000000000010;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;ExcCode<=5'b11111; end   //subu
                6'b101010:begin ALUOP<=12'b000000000100;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;ExcCode<=5'b11111; end   //slt
                6'b101011:begin ALUOP<=12'b000000001000;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;ExcCode<=5'b11111; end   //sltu
                6'b100100:begin ALUOP<=12'b000000010000;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;ExcCode<=5'b11111; end   //and
                6'b100111:begin ALUOP<=12'b000000100000;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;ExcCode<=5'b11111; end   //nor
                6'b100101:begin ALUOP<=12'b000001000000;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;ExcCode<=5'b11111; end   //or
                6'b100110:begin ALUOP<=12'b000010000000;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;ExcCode<=5'b11111; end   //xor
                6'b000000:begin ALUOP<=12'b000100000000;ALUSrc1<=1;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b10;ExcCode<=5'b11111; end   //sll
                6'b000010:begin ALUOP<=12'b001000000000;ALUSrc1<=1;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b10;ExcCode<=5'b11111; end   //srl
                6'b000011:begin ALUOP<=12'b010000000000;ALUSrc1<=1;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b10;ExcCode<=5'b11111; end   //sra

                6'b000100:begin ALUOP<=12'b000100000000;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;ExcCode<=5'b11111; end   //sllv
                6'b000110:begin ALUOP<=12'b001000000000;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;ExcCode<=5'b11111; end   //srlv
                6'b000111:begin ALUOP<=12'b010000000000;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;ExcCode<=5'b11111; end   //srav
                
                6'b001000:begin ALUOP<=12'b000000000001;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=0;PCSrcForward<=1;ExtratoReg<=0;RegDst<=2'h2;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;ExcCode<=5'b11111; end    //jr
                6'b001001:begin ALUOP<=12'b000000000001;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=1;ExtratoReg<=1;RegDst<=2'h2;ExtraDataSrc<=3'b001;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;ExcCode<=5'b11111; end    //jalr

                6'b010000:begin ALUOP<=12'b000000000001;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=1;RegDst<=2'h1;ExtraDataSrc<=3'b010;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b00;ExcCode<=5'b11111; end    //mfhi
                6'b010010:begin ALUOP<=12'b000000000001;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=1;PCSrcForward<=0;ExtratoReg<=1;RegDst<=2'h1;ExtraDataSrc<=3'b100;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b00;ExcCode<=5'b11111; end    //mflo
                6'b010001:begin ALUOP<=12'b000000000001;ALUSrc1<=0;ALUSrc2<=2'h2;RegWrite<=0;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=1;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;ExcCode<=5'b11111; end    //mthi
                6'b010011:begin ALUOP<=12'b000000000001;ALUSrc1<=0;ALUSrc2<=2'h2;RegWrite<=0;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h1;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=1;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;ExcCode<=5'b11111; end    //mtlo

                6'b011010:begin ALUOP<=12'b000000000001;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=0;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h0;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=1;MDUOP<=4'b0100;RDataValid<=2'b11;ExcCode<=5'b11111; end    //div
                6'b011011:begin ALUOP<=12'b000000000001;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=0;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h0;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=1;MDUOP<=4'b1000;RDataValid<=2'b11;ExcCode<=5'b11111; end    //divu
                6'b011000:begin ALUOP<=12'b000000000001;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=0;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h0;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=1;MDUOP<=4'b0001;RDataValid<=2'b11;ExcCode<=5'b11111; end    //mult
                6'b011001:begin ALUOP<=12'b000000000001;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=0;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h0;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=1;MDUOP<=4'b0010;RDataValid<=2'b11;ExcCode<=5'b11111; end    //multu

                6'b001101:begin ALUOP<=12'b000000000001;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=0;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h0;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b00;ExcCode<=5'b01001; end    //break
                6'b001100:begin ALUOP<=12'b000000000001;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=0;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h0;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b00;ExcCode<=5'b01000; end    //syscall

                default:begin ALUOP<=12'b000000000000;ALUSrc1<=0;ALUSrc2<=2'h0;RegWrite<=0;PCSrcForward<=0;ExtratoReg<=0;RegDst<=2'h0;ExtraDataSrc<=3'b000;HIWrite<=0;LOWrite<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b00;ExcCode<=5'b11111; end
            endcase
        end

        //I
        6'b001000:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=0;RegWrite<=1;MemtoReg<=0;ALUOP<=12'b000000000001;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //ADDI
        6'b001001:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=0;RegWrite<=1;MemtoReg<=0;ALUOP<=12'b000000000001;SignExt<=1;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //ADDIU
        6'b001010:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=0;RegWrite<=1;MemtoReg<=0;ALUOP<=12'b000000000100;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //SLTI
        6'b001011:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=0;RegWrite<=1;MemtoReg<=0;ALUOP<=12'b000000001000;SignExt<=1;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //SLTIU
        6'b001100:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=0;RegWrite<=1;MemtoReg<=0;ALUOP<=12'b000000010000;SignExt<=1;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //ANDI
        6'b001101:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=0;RegWrite<=1;MemtoReg<=0;ALUOP<=12'b000001000000;SignExt<=1;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //ORI
        6'b001110:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=0;RegWrite<=1;MemtoReg<=0;ALUOP<=12'b000010000000;SignExt<=1;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //XORI
        6'b001111:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=0;RegWrite<=1;MemtoReg<=0;ALUOP<=12'b100000000000;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b00;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //LUI
        6'b100011:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=0;RegWrite<=1;MemtoReg<=1;ALUOP<=12'b000000000001;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //LW
        6'b100000:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=0;RegWrite<=1;MemtoReg<=1;ALUOP<=12'b000000000001;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h2;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //LB
        6'b100100:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=0;RegWrite<=1;MemtoReg<=1;ALUOP<=12'b000000000001;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h2;MemSignExt<=1;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //LBU
        6'b100001:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=0;RegWrite<=1;MemtoReg<=1;ALUOP<=12'b000000000001;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h1;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //LH
        6'b100101:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=0;RegWrite<=1;MemtoReg<=1;ALUOP<=12'b000000000001;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h1;MemSignExt<=1;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //LHU
        6'b101011:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=1;RegWrite<=0;MemtoReg<=0;ALUOP<=12'b000000000001;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //SW
        6'b101000:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=1;RegWrite<=0;MemtoReg<=0;ALUOP<=12'b000000000001;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h2;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //SB
        6'b101001:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h1;MemWrite<=1;RegWrite<=0;MemtoReg<=0;ALUOP<=12'b000000000001;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h1;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //SH

        //J
        6'b000010:begin RegDst<=2'h2;ALUSrc1<=0;ALUSrc2<=2'h0;MemWrite<=0;RegWrite<=0;MemtoReg<=0;ALUOP<=12'b000000000001;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=1;outPC<={inPC[31:28],JumpTarget,2'b00};BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b00;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //J
        6'b000011:begin RegDst<=2'h2;ALUSrc1<=0;ALUSrc2<=2'h0;MemWrite<=0;RegWrite<=1;MemtoReg<=0;ALUOP<=12'b000000000001;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=1;outPC<={inPC[31:28],JumpTarget,2'b00};BranchType<=6'b0;ExtratoReg<=1;ExtraDataSrc<=3'b001;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b00;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //JAL

        6'b000100:begin RegDst<=2'h2;ALUSrc1<=0;ALUSrc2<=2'h0;MemWrite<=0;RegWrite<=0;MemtoReg<=0;ALUOP<=12'b000000000010;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=1;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b000001;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //BEQ
        6'b000101:begin RegDst<=2'h2;ALUSrc1<=0;ALUSrc2<=2'h0;MemWrite<=0;RegWrite<=0;MemtoReg<=0;ALUOP<=12'b000000000010;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=1;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b000010;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b11;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //BNE
        6'b000111:begin RegDst<=2'h2;ALUSrc1<=0;ALUSrc2<=2'h2;MemWrite<=0;RegWrite<=0;MemtoReg<=0;ALUOP<=12'b000000000010;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=1;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b001000;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //BGTZ
        6'b000110:begin RegDst<=2'h2;ALUSrc1<=0;ALUSrc2<=2'h2;MemWrite<=0;RegWrite<=0;MemtoReg<=0;ALUOP<=12'b000000000010;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=1;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b010000;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end //BLEZ
        6'b000001:begin RegDst<=2'h2;ALUSrc1<=0;ALUSrc2<=2'h2;MemWrite<=0;MemtoReg<=0;ALUOP<=12'b000000000010;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=1;PCSrcForward<=0;outPC<=32'b0;ExtratoReg<=1;ExtraDataSrc<=3'b001;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b01;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0;
                        case (rt)
                            5'b00001:begin RegWrite<=0;BranchType<=6'b000100; end   //BGEZ
                            5'b00000:begin RegWrite<=0;BranchType<=6'b100000; end   //BLTZ
                            5'b10001:begin RegWrite<=1;BranchType<=6'b000100; end   //BGEZAL
                            5'b10000:begin RegWrite<=1;BranchType<=6'b100000; end   //BLTZAL
                            default: begin RegWrite<=0;BranchType<=6'b000000; end
                        endcase
                   end

        6'b010000:begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h0;MemWrite<=0;MemtoReg<=0;ALUOP<=12'b000000000001;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;
                    case (rs)
                        5'b10000:begin MTC0<=0;ERET<=1;CP0toReg<=0;RegWrite<=0;RDataValid<=2'b00; end   //ERET
                        5'b00000:begin MTC0<=0;ERET<=0;CP0toReg<=1;RegWrite<=1;RDataValid<=2'b00; end   //MFC0
                        5'b00100:begin MTC0<=1;ERET<=0;CP0toReg<=0;RegWrite<=0;RDataValid<=2'b10; end   //MTC0
                        default: begin MTC0<=0;ERET<=0;CP0toReg<=0;RegWrite<=0;RDataValid<=2'b00; end
                    endcase
                  end
        default: begin RegDst<=2'h0;ALUSrc1<=0;ALUSrc2<=2'h0;MemWrite<=0;RegWrite<=0;MemtoReg<=0;ALUOP<=12'b000000000000;SignExt<=0;HIWrite<=0;LOWrite<=0;PCSrc<=0;PCSrcForward<=0;outPC<=32'b0;BranchType<=6'b0;ExtratoReg<=0;ExtraDataSrc<=3'b000;MemSize<=2'h0;MemSignExt<=0;HILOWrite<=0;MDUOP<=4'b0000;RDataValid<=2'b00;MTC0<=0;ERET<=0;ExcCode<=5'b11111;CP0toReg<=0; end
        endcase
    end

endmodule
