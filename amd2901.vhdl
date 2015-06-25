--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

library cells;
use cells.all;

ENTITY amd2901 IS
PORT(
  a	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  b	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  cin	: IN STD_LOGIC;
  clk	: IN STD_LOGIC;
  cout	: OUT STD_LOGIC;
  d	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  i	: IN STD_LOGIC_VECTOR(8 DOWNTO 0);
  ng	: OUT STD_LOGIC;
  noe	: IN STD_LOGIC;
  np	: OUT STD_LOGIC;
  ovr	: OUT STD_LOGIC;
  q0	: INOUT STD_LOGIC;
  q3	: INOUT STD_LOGIC;
  r0	: INOUT STD_LOGIC;
  r3	: INOUT STD_LOGIC;
  f3	: OUT STD_LOGIC;
  vdde	: IN STD_LOGIC;
  vddi	: IN STD_LOGIC;
  vsse	: IN STD_LOGIC;
  vssi	: IN STD_LOGIC;
  y	: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  zero	: OUT STD_LOGIC
);
END amd2901;

ARCHITECTURE RTL OF amd2901 IS
  SIGNAL a_from_pads	: STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL b_from_pads	: STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL cin_from_pads	: STD_LOGIC;
  SIGNAL ck_ring	: STD_LOGIC;
  SIGNAL ckc	: STD_LOGIC;
  SIGNAL cout_to_pads	: STD_LOGIC;
  SIGNAL d_from_pads	: STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL i_from_pads	: STD_LOGIC_VECTOR(8 DOWNTO 0);
  SIGNAL ng_to_pads	: STD_LOGIC;
  SIGNAL noe_from_pads	: STD_LOGIC;
  SIGNAL np_to_pads	: STD_LOGIC;
  SIGNAL ovr_to_pads	: STD_LOGIC;
  SIGNAL q0_from_pads	: STD_LOGIC;
  SIGNAL q0_to_pads	: STD_LOGIC;
  SIGNAL q3_from_pads	: STD_LOGIC;
  SIGNAL q3_to_pads	: STD_LOGIC;
  SIGNAL r0_from_pads	: STD_LOGIC;
  SIGNAL r0_to_pads	: STD_LOGIC;
  SIGNAL r3_from_pads	: STD_LOGIC;
  SIGNAL r3_to_pads	: STD_LOGIC;
  SIGNAL shift_l	: STD_LOGIC;
  SIGNAL shift_r	: STD_LOGIC;
  SIGNAL f3_to_pads	: STD_LOGIC;
  SIGNAL y_oe	: STD_LOGIC;
  SIGNAL y_to_pads	: STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL zero_to_pads	: STD_LOGIC;

  COMPONENT pvsseck_px
  PORT(
  ck	: IN STD_LOGIC;
  cko	: OUT STD_LOGIC;
  vdde	: IN STD_LOGIC;
  vddi	: IN STD_LOGIC;
  vsse	: IN STD_LOGIC;
  vssi	: IN STD_LOGIC
   );
  END COMPONENT;

  COMPONENT pvddeck_px
  PORT(
  ck	: IN STD_LOGIC;
  cko	: OUT STD_LOGIC;
  vdde	: IN STD_LOGIC;
  vddi	: IN STD_LOGIC;
  vsse	: IN STD_LOGIC;
  vssi	: IN STD_LOGIC
   );
  END COMPONENT;

  COMPONENT pvssick_px
  PORT(
  ck	: IN STD_LOGIC;
  cko	: OUT STD_LOGIC;
  vdde	: IN STD_LOGIC;
  vddi	: IN STD_LOGIC;
  vsse	: IN STD_LOGIC;
  vssi	: IN STD_LOGIC
   );
  END COMPONENT;

  COMPONENT piot_px
  PORT(
  b	: IN STD_LOGIC;
  ck	: IN STD_LOGIC;
  i	: IN STD_LOGIC;
  pad   : INOUT STD_LOGIC;
  t	: OUT STD_LOGIC;
  vdde	: IN STD_LOGIC;
  vddi	: IN STD_LOGIC;
  vsse	: IN STD_LOGIC;
  vssi	: IN STD_LOGIC
   );
  END COMPONENT;

  COMPONENT pot_px
  PORT(
  b	: IN STD_LOGIC;
  ck	: IN STD_LOGIC;
  i	: IN STD_LOGIC;
  pad	: OUT STD_LOGIC;
  vdde	: IN STD_LOGIC;
  vddi	: IN STD_LOGIC;
  vsse	: IN STD_LOGIC;
  vssi	: IN STD_LOGIC
   );
  END COMPONENT;

  COMPONENT po_px
  PORT(
  ck	: IN STD_LOGIC;
  i	: IN STD_LOGIC;
  pad	: OUT STD_LOGIC;
  vdde	: IN STD_LOGIC;
  vddi	: IN STD_LOGIC;
  vsse	: IN STD_LOGIC;
  vssi	: IN STD_LOGIC
   );
  END COMPONENT;

  COMPONENT pvddick_px
  PORT(
  ck	: IN STD_LOGIC;
  cko	: OUT STD_LOGIC;
  vdde	: IN STD_LOGIC;
  vddi	: IN STD_LOGIC;
  vsse	: IN STD_LOGIC;
  vssi	: IN STD_LOGIC
   );
  END COMPONENT;

  COMPONENT coeur
  PORT(
  a_from_pads	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  b_from_pads	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  cin_from_pads	: IN STD_LOGIC;
  ck	: IN STD_LOGIC;
  cout_to_pads	: OUT STD_LOGIC;
  d_from_pads	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  i_from_pads	: IN STD_LOGIC_VECTOR(8 DOWNTO 0);
  ng_to_pads	: OUT STD_LOGIC;
  noe_from_pads	: IN STD_LOGIC;
  np_to_pads	: OUT STD_LOGIC;
  ovr_to_pads	: OUT STD_LOGIC;
  q0_from_pads	: IN STD_LOGIC;
  q0_to_pads	: OUT STD_LOGIC;
  q3_from_pads	: IN STD_LOGIC;
  q3_to_pads	: OUT STD_LOGIC;
  r0_from_pads	: IN STD_LOGIC;
  r0_to_pads	: OUT STD_LOGIC;
  r3_from_pads	: IN STD_LOGIC;
  r3_to_pads	: OUT STD_LOGIC;
  shift_l	: OUT STD_LOGIC;
  shift_r	: OUT STD_LOGIC;
  f3_to_pads	: OUT STD_LOGIC;
  vdd	: IN STD_LOGIC;
  vss	: IN STD_LOGIC;
  y_oe	: OUT STD_LOGIC;
  y_to_pads	: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  zero_to_pads	: OUT STD_LOGIC
   );
  END COMPONENT;

  COMPONENT pi_px
  PORT(
  ck	: IN STD_LOGIC;
  pad	: IN STD_LOGIC;
  t	: OUT STD_LOGIC;
  vdde	: IN STD_LOGIC;
  vddi	: IN STD_LOGIC;
  vsse	: IN STD_LOGIC;
  vssi	: IN STD_LOGIC
   );
  END COMPONENT;

  COMPONENT pck_px
  PORT(
  ck	: OUT STD_LOGIC;
  pad	: IN STD_LOGIC;
  vdde	: IN STD_LOGIC;
  vddi	: IN STD_LOGIC;
  vsse	: IN STD_LOGIC;
  vssi	: IN STD_LOGIC
   );
  END COMPONENT;

BEGIN
  p_a2 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => a(2),
    t => a_from_pads(2),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_d3 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => d(3),
    t => d_from_pads(3),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_i1 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => i(1),
    t => i_from_pads(1),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_vsseck0 : pvsseck_px
  PORT MAP (
    ck => ck_ring,
    cko => ckc,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_vddick0 : pvddick_px
  PORT MAP (
    ck => ck_ring,
    cko => ckc,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_b1 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => b(1),
    t => b_from_pads(1),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_a1 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => a(1),
    t => a_from_pads(1),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_i0 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => i(0),
    t => i_from_pads(0),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_ovr : po_px
  PORT MAP (
    ck => ck_ring,
    i => ovr_to_pads,
    pad => ovr,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_i7 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => i(7),
    t => i_from_pads(7),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_d1 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => d(1),
    t => d_from_pads(1),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_d0 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => d(0),
    t => d_from_pads(0),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_b0 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => b(0),
    t => b_from_pads(0),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_a0 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => a(0),
    t => a_from_pads(0),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_vsseck1 : pvsseck_px
  PORT MAP (
    ck => ck_ring,
    cko => ckc,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_np : po_px
  PORT MAP (
    ck => ck_ring,
    i => np_to_pads,
    pad => np,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_ck : pck_px
  PORT MAP (
    ck => ck_ring,
    pad => clk,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_i2 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => i(2),
    t => i_from_pads(2),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_f3 : po_px
  PORT MAP (
    ck => ck_ring,
    i => f3_to_pads,
    pad => f3,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_zero : po_px
  PORT MAP (
    ck => ck_ring,
    i => zero_to_pads,
    pad => zero,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_cout : po_px
  PORT MAP (
    ck => ck_ring,
    i => cout_to_pads,
    pad => cout,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_i6 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => i(6),
    t => i_from_pads(6),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_cin : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => cin,
    t => cin_from_pads,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_d2 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => d(2),
    t => d_from_pads(2),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_a3 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => a(3),
    t => a_from_pads(3),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_b3 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => b(3),
    t => b_from_pads(3),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_vssick0 : pvssick_px
  PORT MAP (
    ck => ck_ring,
    cko => ckc,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_i5 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => i(5),
    t => i_from_pads(5),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  icoeur : coeur
  PORT MAP (
    a_from_pads => a_from_pads,
    b_from_pads => b_from_pads,
    cin_from_pads => cin_from_pads,
    ck => ckc,
    cout_to_pads => cout_to_pads,
    d_from_pads => d_from_pads,
    i_from_pads => i_from_pads,
    ng_to_pads => ng_to_pads,
    noe_from_pads => noe_from_pads,
    np_to_pads => np_to_pads,
    ovr_to_pads => ovr_to_pads,
    q0_from_pads => q0_from_pads,
    q0_to_pads => q0_to_pads,
    q3_from_pads => q3_from_pads,
    q3_to_pads => q3_to_pads,
    r0_from_pads => r0_from_pads,
    r0_to_pads => r0_to_pads,
    r3_from_pads => r3_from_pads,
    r3_to_pads => r3_to_pads,
    shift_l => shift_l,
    shift_r => shift_r,
    f3_to_pads => f3_to_pads,
    vdd => vddi,
    vss => vssi,
    y_oe => y_oe,
    y_to_pads => y_to_pads,
    zero_to_pads => zero_to_pads
  );
  p_i3 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => i(3),
    t => i_from_pads(3),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_vddeck1 : pvddeck_px
  PORT MAP (
    ck => ck_ring,
    cko => ckc,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_ng : po_px
  PORT MAP (
    ck => ck_ring,
    i => ng_to_pads,
    pad => ng,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_noe : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => noe,
    t => noe_from_pads,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_b2 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => b(2),
    t => b_from_pads(2),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_i4 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => i(4),
    t => i_from_pads(4),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_vddeck0 : pvddeck_px
  PORT MAP (
    ck => ck_ring,
    cko => ckc,
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
  p_i8 : pi_px
  PORT MAP (
    ck => ck_ring,
    pad => i(8),
    t => i_from_pads(8),
    vdde => vdde,
    vddi => vddi,
    vsse => vsse,
    vssi => vssi
  );
END RTL;
