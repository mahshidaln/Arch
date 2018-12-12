Library IEEE;
use IEEE.std_logic_1164.all;

entity fa is
        port(a, b, cin:in std_logic;
        cout, s: out std_logic);
end entity;

architecture gate_level1 of fa is
  signal w1,w2,w3:std_logic;
begin
  w1 <= a xor b;
  w2 <= cin and w1;
  w3 <= a and b;
  s <= w1 xor cin;
  cout <= w2 or w3;
end architecture;

