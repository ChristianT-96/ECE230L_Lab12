module onehot(
    input w,
    input clk,
    input reset,
    output z,
    output A,
    output B,
    output C,
    output D,
    output E
);
    wire Anext, Bnext, Cnext, Dnext, Enext;
    wire Astate, Bstate, Cstate, Dstate, Estate;
    
    dff Adff(
        .Default(1'b1),
        .reset(reset),
        .D(Anext),
        .clk(clk),
        .Q(Astate)
    );

    dff Bdff(
        .Default(1'b0),
        .reset(reset),
        .D(Bnext),
        .clk(clk),
        .Q(Bstate)
    );

    dff Cdff(
        .Default(1'b0),
        .reset(reset),
        .D(Cnext),
        .clk(clk),
        .Q(Cstate)
    );
    
    dff Ddff(
        .Default(1'b0),
        .reset(reset),
        .D(Dnext),
        .clk(clk),
        .Q(Dstate)
    );
    
    dff Edff(
        .Default(1'b0),
        .reset(reset),
        .D(Enext),
        .clk(clk),
        .Q(Estate)
    );
    
    assign z = Cstate | Estate;

    assign Anext = 1'b0;
    assign Bnext = (~w & Astate) | (~w & Dstate)| (~w & Estate);
    assign Cnext = (~w & Bstate) | (~w & Cstate);
    assign Dnext = (w & Astate) | (w & Bstate) | (w & Cstate);
    assign Enext = (w & Dstate) | (w & Estate);
    
    assign A = Astate;
    assign B = Bstate;
    assign C = Cstate;
    assign D = Dstate;
    assign E = Estate;
    
endmodule
