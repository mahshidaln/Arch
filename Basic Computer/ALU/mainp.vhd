----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:04:16 10/11/2015 
-- Design Name: 
-- Module Name:    main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mainp is
	port(a , b: in std_logic_vector(3 downto 0); cin1: in std_logic;
	cout: out std_logic; sum: out std_logic_vector(3 downto 0));
end mainp;

architecture Behavioral of mainp is
component fa is
	port (a, b, cin:in std_logic;
        cout, s: out std_logic);
end component;
--signal a: std_logic_vector(3 downto 0);
signal cin: std_logic_vector(4 downto 0);
--signal b:std_logic_vector(3 downto 0);
signal c:std_logic_vector(3 downto 0);
--signal sum: std_logic_vector(3 downto 0);
begin
	cin(0) <= cin1;
	cout <= cin(4);
	c(0) <= b(0) xor cin1;
	c(1) <= b(1) xor cin1;
	c(2) <= b(2) xor cin1;
	c(3) <= b(3) xor cin1;
	for_gen: for i in 0 to 3 generate
		faww: fa port map(a(i), c(i), cin(i), cin(i+1), sum(i));
	end generate for_gen;

end Behavioral;

