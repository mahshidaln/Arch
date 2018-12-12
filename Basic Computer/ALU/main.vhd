----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:56:13 10/18/2015 
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

entity main is
	generic(n:in integer:=4);
	port(x,y: in std_logic_vector(n-1 downto 0); p:out std_logic_vector(2*n-1 downto 0));
end main;

architecture Behavioral of main is
component mainp is
	port(a , b: in std_logic_vector(3 downto 0); cin1: in std_logic;
	cout: out std_logic; sum: out std_logic_vector(3 downto 0));
end component;

--type array2D is array (n-1 downto 0) of std_logic_vector(n downto 1);
--type array2Dd is array (n-2 downto 0) os std_logic_vector(n downto 1);
--signal s : array2D;
--signal g : array2Dd;


signal a1,a2, a3, b1,b2,b3, s1, s2, s3 : std_logic_vector(3 downto 0);
signal c1, c2, c3: std_logic;
--signal p: std_logic_vector(7 downto 0);
begin
		--p(0) <= x(0) and y(0);
		--s(0,4) <= 0;
		--for_g:for i in 0 to n-2 generate
			--for_gg:for j in 1 to n generate
				--g(i,j) <= x(i) and y(j);
			--end generate;
		--end generate;
		--for_gen2:for i in 1 to n-1 generate
--			s(0,i) <= x(i) and y(0);
--		end generate;
	--	for_gen:for i in 0 to n-2 generate
		--	lasdkjf: mainp port map(s(i), g(i), '0',  );
		--end generate
		
		for_g:for i in 0 to 3 generate
			b1(i) <= x(i) and y(1);
			b2(i) <= x(i) and y(2);
			b3(i) <= x(i) and y(3);
		end generate;
		for_qwq:for i in 0 to 2 generate
			a1(i) <= x(i+1) and y(0);
		end generate;
		a1(3) <= '0';
		
		alkfh: mainp port map (a1, b1, '0', c1, s1);
		for_gg:for i in 1 to 3 generate
			a2(i-1) <= s1(i);
		end generate;
		a2(3) <= c1;
		lkjaf: mainp port map(a2, b2, '0',c2, s2);
		for_ggg:for i in 1 to 3 generate
			a3(i-1) <= s2(i);
		end generate;
		a3(3) <= c2;
		lasfkjaf: mainp port map(a3, b3, '0', c3, s3);
		
		for_qw:for i in 3 to 6 generate
			p(i) <= s3(i-3);
		end generate;
		p(7) <= c3;
		p(0) <= x(0) and y(0);
		p(1) <= s1(0);
		p(2) <= s2(0);

end Behavioral;

