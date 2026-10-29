module circuito_lut2 (
    input  logic A, B, C, D,
    output logic X
);

    logic y1, y2;

    // LUT 1: NAND(A, B)
    LUT2 #(.INIT(4'h7)) lut_nand (
        .I0(A), .I1(B), .O(y1)
    );

    // LUT 2: AND(C, D)
    LUT2 #(.INIT(4'h8)) lut_and_cd (
        .I0(C), .I1(D), .O(y2)
    );

    // LUT 3: AND(y1, y2)
    LUT2 #(.INIT(4'h8)) lut_saida (
        .I0(y1), .I1(y2), .O(X)
    );

endmodule
