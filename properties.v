always @(*) begin
    if(active) begin
    `ifdef USE_WB
        _wbs_ack_buf_ : assert(wbs_ack_o    == buf_wbs_ack_o);
        _wbs_dat_buf_ : assert(wbs_dat_o    == buf_wbs_dat_o);
    `endif
    `ifdef USE_LA
        _la1_data_buf_: assert(la1_data_out == buf_la1_data_out);
    `endif
    `ifdef USE_IO
        _io_out_buf_  : assert(io_out       == buf_io_out);
        _io_oeb_buf_  : assert(io_oeb       == buf_io_oeb);
    `endif
    `ifdef USE_IRQ
        _irq_buf_     : assert(irq          == buf_irq);
    `endif
    end
    if(!active) begin
    `ifdef USE_WB
        _wbs_ack_z_   : assert(wbs_ack_o    == 1'b0);
        _wbs_dat_z_   : assert(wbs_dat_o    == 32'b0);
    `endif
    `ifdef USE_LA
        _la1_data_z_  : assert(la1_data_out == 32'b0);
    `endif
    `ifdef USE_IO
        _io_out_z_    : assert(io_out       == `MPRJ_IO_PADS'b0);
        _io_oeb_z_    : assert(io_oeb       == `MPRJ_IO_PADS'b0);
    `endif
    `ifdef USE_IRQ
        _irq_z_       : assert(irq          == 3'b0);
    `endif
    end
end
