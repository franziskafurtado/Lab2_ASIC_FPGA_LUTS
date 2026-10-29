
`timescale 1ns/1ps

module circuito_lut2_tb;

    logic A, B, C, D;
    logic X;

    logic esperado;
    integer erros = 0;

    // Instancia o circuito
    circuito_lut2 dut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .X(X)
    );

    initial begin
        $display(" A B C D | X | Esperado");
        $display("-------------------------");

        // Testa todas as 16 combinacoes
        for (int i = 0; i < 16; i++) begin

            {A, B, C, D} = i;

            #10;

            // Equacao simplificada:
            // X = C.D.(~A + ~B)
            esperado = C & D & (~A | ~B);

            $display(" %b %b %b %b | %b |    %b",
                     A, B, C, D, X, esperado);

            if (X !== esperado) begin
                $display("ERRO na combinacao %b%b%b%b",
                         A, B, C, D);
                erros++;
            end
        end

        $display("-------------------------");

        if (erros == 0)
            $display("TESTE PASSOU: 16 combinacoes corretas!");
        else
            $display("TESTE FALHOU: %0d erros.", erros);

        $finish;
    end

endmodule
