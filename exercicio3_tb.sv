
`timescale 1ns/1ps

module exercicio3_tb;

    logic A, B, Cin;
    logic S, Cout;

    logic [1:0] esperado;
    integer erros = 0;

    exercicio3 dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        $display(" A B Cin | S Cout | S_esp Cout_esp");
        $display("----------------------------------");

        // Testa as 8 combinacoes
        for (int i = 0; i < 8; i++) begin

            {A, B, Cin} = i[2:0];

            #10;

            // Soma esperada de A + B + Cin
            esperado = {1'b0, A} +
                       {1'b0, B} +
                       {1'b0, Cin};

            $display(" %b %b  %b  | %b   %b  |   %b      %b",
                     A, B, Cin, S, Cout,
                     esperado[0], esperado[1]);

            if ({Cout, S} !== esperado) begin
                $display("ERRO em A=%b, B=%b, Cin=%b",
                         A, B, Cin);
                erros++;
            end
        end

        $display("----------------------------------");

        if (erros == 0)
            $display("TESTE PASSOU: 8 combinacoes corretas!");
        else
            $display("TESTE FALHOU: %0d erros.", erros);

        $finish;
    end

endmodule
