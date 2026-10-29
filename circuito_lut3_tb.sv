
`timescale 1ns/1ps

module circuito_lut3_tb;

    logic A3, A2, A1, A0;
    logic Y;

    logic esperado;
    integer erros = 0;

    // Instancia o circuito com LUT3
    circuito_lut3 dut (
        .A3(A3),
        .A2(A2),
        .A1(A1),
        .A0(A0),
        .Y(Y)
    );

    initial begin

        $display(" A3 A2 A1 A0 | Y | Esperado");
        $display("----------------------------");

        // Testa todas as 16 combinacoes
        for (int i = 0; i < 16; i++) begin

            {A3, A2, A1, A0} = i[3:0];

            #10;

            // Equacao booleana simplificada:
            // Y = ~A3.~A2.(~A1 + ~A0)
            //   + A3.A2.(A1 + A0)

            esperado = (~A3 & ~A2 & (~A1 | ~A0)) |
                       (A3 & A2 & (A1 | A0));

            $display("  %b  %b  %b  %b | %b |    %b",
                     A3, A2, A1, A0, Y, esperado);

            if (Y !== esperado) begin
                $display("ERRO na combinacao %b%b%b%b",
                         A3, A2, A1, A0);
                erros++;
            end
        end

        $display("----------------------------");

        if (erros == 0)
            $display("TESTE PASSOU: 16 combinacoes corretas!");
        else
            $display("TESTE FALHOU: %0d erros.", erros);

        $finish;
    end

endmodule
