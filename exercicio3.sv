
module exercicio3 (
    input  logic A,
    input  logic B,
    input  logic Cin,
    output logic S,
    output logic Cout
);

    logic b_xor_cin;
    logic ab, a_cin, b_cin;

    // SOMA: S = A XOR B XOR Cin

    // LUT2 #1: B XOR Cin
    LUT2 #(.INIT(4'h6)) lut_xor1 (
        .I0(B), .I1(Cin), .O(b_xor_cin)
    );

    // LUT2 #2: A XOR (B XOR Cin)
    LUT2 #(.INIT(4'h6)) lut_xor2 (
        .I0(A), .I1(b_xor_cin), .O(S)
    );

    // CARRY: Cout = AB + ACin + BCin

    // LUT2 #3: B AND Cin
    LUT2 #(.INIT(4'h8)) lut_and1 (
        .I0(B), .I1(Cin), .O(b_cin)
    );

    // LUT2 #4: A AND B
    LUT2 #(.INIT(4'h8)) lut_and2 (
        .I0(A), .I1(B), .O(ab)
    );

    // LUT2 #5: A AND Cin
    LUT2 #(.INIT(4'h8)) lut_and3 (
        .I0(A), .I1(Cin), .O(a_cin)
    );

    // LUT3 #1: OR das tres parcelas
    LUT3 #(.INIT(8'hFE)) lut_or3 (
        .I0(b_cin),
        .I1(ab),
        .I2(a_cin),
        .O(Cout)
    );

endmodule
