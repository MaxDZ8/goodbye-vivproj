module mdz_custom_logic #(
    MERGE_OP = "+",
    MERGE_LATENCY = 0
) (
    input clk,
    input merge, which, // when merge hi res = tripletA OP tripletB, otherwise res = which ? tripletB : tripletA 
    input[31:0] ai, bi, ci, di, ei, fi,
    output[31:0] q,
    output equal // high if the two triplets are the same
);

assign one = ai + bi + ci;
assign two = di + ei + fi;

wire[31:0] res;
wire equal_triplets = one == two;
if (MERGE_OP == "+") begin : op_add
    assign res = one + two;
end
else if (MERGE_OP == "^") begin : op_xor
    assign res = one ^ two;
end
else begin
    initial begin
        $display("Unsupported MERGE_OP.");
        $finish;
    end
end

wire[31:0] selected = merge ? res : (which ? two : one);
if (MERGE_LATENCY == 0) begin : out_rename
    assign q = selected;
    assign eq = equal_triplets;
end
else if (MERGE_LATENCY == 1) begin : out_ff
    int unsigned buff = 32'b0;
    always_ff @(posedge clk) buff <= selected;
    assign q = buff;
    
    bit buff_eq = 1'b0;
    always_ff @(posedge clk) buff_eq <= equal_triplets;
    assign eq = buff_eq;
end
else begin
    initial begin
        $display("Unsupported MERGE_LATENCY.");
        $finish;
    end
end

endmodule