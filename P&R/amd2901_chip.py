# chip = { 'pads.south'     : [ 'p_a3'  , 'p_a2', 'p_a1', 'p_r0', 'p_vddick0','p_cin', 'p_a0', 'p_i6', 'p_i8' , 'p_i7'  , 'p_r3' ]
#        , 'pads.east'      : [ 'p_zero', 'p_vddeck0', 'p_vsseck0', 'p_i0', 'p_i1', 'p_i2', 'p_i3', 'p_i4', 'p_i5' , 'p_d0'  , 'p_q3' ]
#        , 'pads.north'     : [ 'p_ng' , 'p_y3', 'p_y2', 'p_y1', 'p_y0', 'p_vddeck1', 'p_vsseck1', 'p_np', 'p_ovr', 'p_cout', 'p_noe' ]
#        , 'pads.west'      : [ 'p_b0', 'p_b1', 'p_b2', 'p_b3', 'p_vssick0','p_d1','p_ck','p_d2', 'p_d3', 'p_q0', 'p_f3' ]
#        , 'chip.size'      : ( 13000, 13000 )
#        , 'core.size'      : ( 11000, 11000 )
#        , 'chip.clockTree' : True
#        }

chip = { 'pads.south'     : [ 'p_a3'  , 'p_a2', 'p_a1', 'p_r0', 'p_vddick0','p_cin', 'p_a0', 'p_i6', 'p_i8' , 'p_i7'  , 'p_r3' ]
       , 'pads.east'      : [ 'p_q3', 'p_i0', 'p_i1', 'p_i2', 'p_vddeck0', 'p_vsseck0', 'p_zero', 'p_b0', 'p_b1' , 'p_b2'  , 'p_b3' ]
       , 'pads.north'     : [ 'p_noe' , 'p_y3', 'p_y2', 'p_y1', 'p_y0', 'p_vddeck1', 'p_vsseck1', 'p_np', 'p_ovr', 'p_cout', 'p_ng' ]
       , 'pads.west'      : [ 'p_i4', 'p_i5', 'p_i3', 'p_d0', 'p_vssick0','p_d1','p_ck','p_d2', 'p_d3', 'p_q0', 'p_f3' ]
       , 'chip.size'      : ( 3420, 3420)
       , 'core.size'      : ( 2200, 2200 )
       , 'chip.clockTree' : True
       }

# chip = { 'pads.south'     : [ 'p_a3'  , 'p_a2', 'p_a1', 'p_vddick0','p_cin', 'p_a0', 'p_i6', 'p_i8' , 'p_i7' ]
#        , 'pads.east'      : [ 'p_zero', 'p_i0', 'p_i1', 'p_i2', 'p_vddeck0', 'p_vsseck0', 'p_b0', 'p_b1' , 'p_b2'  , 'p_b3' ]
#        , 'pads.north'     : [ 'p_noe' , 'p_vddeck1', 'p_vsseck1', 'p_np', 'p_ovr', 'p_cout', 'p_ng', 'amd2901_inst' ]
#        , 'pads.west'      : [ 'p_i4', 'p_i5', 'p_i3', 'p_d0', 'p_vssick0','p_d1','p_ck','p_d2', 'p_d3', 'p_f3' ]
#        , 'chip.size'      : ( 3000, 3000)
#        , 'core.size'      : ( 1200, 1200 )
#        , 'chip.clockTree' : True
#        }

# export MBK_OUT_LO=al
# lvx vst al amd2901_clocked amd2901_coug -f
