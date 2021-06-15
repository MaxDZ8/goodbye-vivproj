module mdz_custom_logic (
    input[31:0] ai, bi, ci, di, ei, fi,
	output[31:0] q
);

assign one = ai + bi + ci;
assign two = di + ei + fi;

assign q = one + two;

endmodule;