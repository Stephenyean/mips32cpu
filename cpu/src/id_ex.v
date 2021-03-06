`timescale 1ns / 1ps
module id_ex(
    input wire clock,
    input wire reset,
    input wire ready,
    input wire flush,
    input wire[31:0] flushTarget,
    input wire PauseSignal,
    input wire[7:0] IdALUOperation,
    input wire[2:0] IdALUSel,
    input wire[31:0] IdRegister1,
    input wire[31:0] IdRegister2,
    input wire[4:0] IdWriteAddress,
    input wire IdWriteRegister,
    input wire IdWriteHi,
    input wire IdWriteLo,
    input wire[4:0] IdWriteCPAddress,
    input wire[31:0] IdLinkAddress,
    input wire IdIsInDelaySlot,
    input wire Idtlbwi,
    input wire Idsyscall,
    input wire Ideret,
    input wire Idprivilege,
    input wire IdValidInstruction,
    input wire[15:0] IdInstruction,
    input wire PCTLBMiss,
    input wire[31:0] IdPC,
    output reg[7:0] ExALUOperation,
    output reg[2:0] ExALUSel,
    output reg[31:0] ExRegister1,
    output reg[31:0] ExRegister2,
    output reg[4:0] ExWriteAddress,
    output reg ExWriteRegister,
    output reg ExWriteHi,
    output reg ExWriteLo,
    output reg[4:0] ExWriteCPAddress,
    output reg[31:0] ExLinkAddress,
    output reg ExIsInDelaySlot,
    output reg Extlbwi,
    output reg Exsyscall,
    output reg Exeret,
    output reg Exprivilege,
    output reg ExValidInstruction,
    output reg[15:0] ExInstruction,
    output reg PCTLBMissOut,
    output reg[31:0] ExPC
);
    always @ (posedge clock) begin
        if (reset == 1'b0) begin
            ExALUOperation <= 8'b00000000;
            ExALUSel <= 3'b000;
            ExRegister1 <= 32'b0;
            ExRegister2 <= 32'b0;
            ExWriteAddress <= 5'b00000;
            ExWriteRegister <= 1'b0;
            ExWriteHi <= 1'b0;
            ExWriteLo <= 1'b0;
            ExWriteCPAddress <= 5'b00000;
            ExLinkAddress <= 32'b0;
            ExIsInDelaySlot <= 1'b0;
            ExInstruction <= 32'b0;
            Extlbwi <= 1'b0;
            Exsyscall <= 1'b0;
            Exeret <= 1'b0;
            Exprivilege <= 1'b0;
            ExValidInstruction <= 1'b0;
            PCTLBMissOut <= 1'b0;
            ExPC <= 32'b0;
        end else if(ready == 1'b0) begin
        end else if(flush == 1'b1) begin
            ExALUOperation <= 8'b00000000;
            ExALUSel <= 3'b000;
            ExRegister1 <= 32'b0;
            ExRegister2 <= 32'b0;
            ExWriteAddress <= 5'b00000;
            ExWriteRegister <= 1'b0;
            ExWriteHi <= 1'b0;
            ExWriteLo <= 1'b0;
            ExWriteCPAddress <= 5'b00000;
            ExLinkAddress <= 32'b0;
            ExIsInDelaySlot <= 1'b0;
            ExInstruction <= 32'b0;
            Extlbwi <= 1'b0;
            Exsyscall <= 1'b0;
            Exeret <= 1'b0;
            Exprivilege <= 1'b0;
            ExValidInstruction <= 1'b0;
            PCTLBMissOut <= 1'b0;
            ExPC <= flushTarget;
        end else if(PauseSignal == 1'b1) begin
            ExALUOperation <= 8'b00000000;
            ExALUSel <= 3'b000;
            ExRegister1 <= 32'b0;
            ExRegister2 <= 32'b0;
            ExWriteAddress <= 5'b00000;
            ExWriteRegister <= 1'b0;
            ExWriteHi <= 1'b0;
            ExWriteLo <= 1'b0;
            ExWriteCPAddress <= 5'b00000;
            ExLinkAddress <= 32'b0;
            ExIsInDelaySlot <= IdIsInDelaySlot;
            ExInstruction <= 32'b0;
            Extlbwi <= 1'b0;
            Exsyscall <= 1'b0;
            Exeret <= 1'b0;
            Exprivilege <= 1'b0;
            ExValidInstruction <= 1'b0;
            PCTLBMissOut <= 1'b0;
            ExPC <= IdPC;
        end else begin
            ExALUOperation <= IdALUOperation;
            ExALUSel <= IdALUSel;
            ExRegister1 <= IdRegister1;
            ExRegister2 <= IdRegister2;
            ExWriteAddress <= IdWriteAddress;
            ExWriteRegister <= IdWriteRegister;
            ExWriteHi <= IdWriteHi;
            ExWriteLo <= IdWriteLo;
            ExWriteCPAddress <= IdWriteCPAddress;
            ExLinkAddress <= IdLinkAddress;
            ExIsInDelaySlot <= IdIsInDelaySlot;
            ExInstruction <= IdInstruction;
            Extlbwi <= Idtlbwi;
            Exsyscall <= Idsyscall;
            Exeret <= Ideret;
            Exprivilege <= Idprivilege;
            ExValidInstruction <= IdValidInstruction;
            PCTLBMissOut <= PCTLBMiss;
            ExPC <= IdPC;
        end
    end
endmodule