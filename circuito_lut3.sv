
module circuito_lut3 (
    input  logic A3, A2, A1, A0,
    output logic Y
);

    logic y1, y2;

    // LUT3 #1
    // Y1 = ~A3.~A2.~A1 + A3.A2.A1
    LUT3 #(.INIT(8'h81)) lut1 (
        .I0(A1),
        .I1(A2),
        .I2(A3),
        .O(y1)
    );

    // LUT3 #2
    // Y2 = ~A3.~A2.~A0 + A3.A2.A0
    LUT3 #(.INIT(8'h81)) lut2 (
        .I0(A0),
        .I1(A2),
        .I2(A3),
        .O(y2)
    );

    // LUT3 #3
    // Y = Y1 + Y2
    LUT3 #(.INIT(8'hEE)) lut3 (
        .I0(y1),
        .I1(y2),
        .I2(1'b0),
        .O(Y)
    );

endmodule
