always @(*) begin
    if(active) begin
        _wbs_ack_buf_: assert(wbs_ack_o    == buf_wbs_ack_o);
        _wbs_dat_buf_: assert(wbs_dat_o    == buf_wbs_dat_o);
        _la_data_buf_: assert(la_data_out  == buf_la_data_out);
        _io_out_buf_ : assert(io_out       == buf_io_out);
        _io_oeb_buf_ : assert(io_oeb       == buf_io_oeb);
        _irq_buf_    : assert(irq          == buf_irq);
    end
    if(!active) begin
        _wbs_ack_z_  : assert(wbs_ack_o    == 1'b0);
        _wbs_dat_z_  : assert(wbs_dat_o    == 32'b0);
        _la_data_z_  : assert(la_data_out  == 32'b0);
        _io_out_z_   : assert(io_out       == `MPRJ_IO_PADS'b0);
        _io_oeb_z_   : assert(io_oeb       == `MPRJ_IO_PADS'b0);
        _irq_z_      : assert(irq          == 3'b0);
    end
end
