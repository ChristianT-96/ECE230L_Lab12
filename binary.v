module binary(
    input w,
    input clk,
    input reset,
    output z,
    output [2:0]Bstate
);

    wire [2:0] State;
    wire [2:0] Next;

    dff zero(
        .D(Next[0]),
        .reset(reset),
        .Default(1'b0),
        .clk(clk),
        .Q(State[0])
    );

    dff one(
        .D(Next[1]),
        .reset(reset),
        .Default(1'b0),
        .clk(clk),
        .Q(State[1])
    );
    
    dff two(
        .D(Next[2]),
        .reset(reset),
        .Default(1'b0),
        .clk(clk),
        .Q(State[2])
    );

    assign z = (~State[2] & State[1] & ~State[0]) | (State[2] & ~State[1] & ~State[0]);
    assign Next[0] = (~State[1] & ~State[0] & ~w) | (~State[2] & ~State[0] & w) | ( ~State[1] & State[0] & w) | (State[1] & State[0] & ~w);
    assign Next[1] = (State[1] & ~State[0]) | (~State[2] & ~State[0] & w) | (~State[1] & State[0]);
    assign Next[2] = (State[2] & w) | (State[1] & State[0] & w);

    assign Bstate[0] = State[0];
    assign Bstate[1] = State[1];
    assign Bstate[2] = State[2];
endmodule
