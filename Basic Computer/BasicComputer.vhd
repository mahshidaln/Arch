----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:00:51 12/06/2015 
-- Design Name: 
-- Module Name:    BC - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.numeric_bit.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BC is
	port(outout:out std_logic; pcout:out std_logic_vector(5 downto 0); tmpout:out std_logic;inp:in std_logic_vector(15 downto 0); clk:in std_logic; outp:out std_logic_vector(15 downto 0); clkoo:out std_logic);
end BC;


architecture Behavioral of BC is

component alumain is
	port(com : in std_logic_vector(2 downto 0); a, b : in std_logic_vector(3 downto 0);
		output: out std_logic_vector(7 downto 0));
end component;

component myram is
	port(w: in std_logic; input: in std_logic_vector(15 downto 0); ad: in std_logic_vector
(5 downto 0); output: out std_logic_vector(15 downto 0));
end component;

component maincounter is
	port(count, mainload, clok: in std_logic;dds:in std_logic_vector(7 downto 0);qs:out std_logic_vector(7 downto 0); carryout:out std_logic; clkout:out std_logic);
end component;

type array_2D is array(0 to 63) of std_logic_vector(15 downto 0);
signal memory : array_2D;

signal intpc: integer := 0;
signal flag:integer := 0;
signal flag33:integer := 0;
signal flag4:integer := 0;
signal flag5:integer := 0;
signal aaa:integer := 0;
signal ac:std_logic_vector(7 downto 0);
signal tmppc:std_logic_vector(5 downto 0) := "000000";
signal pc:std_logic_vector(5 downto 0) := "000000";
signal writereg:std_logic := '0';
signal inputram:std_logic_vector(15 downto 0);
signal adram:std_logic_vector(5 downto 0);
signal movreg,outputram, ir:std_logic_vector(15 downto 0);
signal alucommand:std_logic_vector(2 downto 0);
signal op1, op2:std_logic_vector(3 downto 0);
signal aluout:std_logic_vector(7 downto 0);
signal counterload:std_logic := '0';
signal counter1:std_logic := '1';
signal loadcdata:std_logic_vector(7 downto 0);
signal sc: std_logic_vector(7 downto 0);
signal caryout, clkout:std_logic;
signal outflag:std_logic := '0';
signal tmpclk:std_logic;
signal tmout :std_logic := '0';
begin
	
	--ramm: myram port map(writereg, inputram, adram, outputram);
	alumainn: alumain port map(alucommand, op1, op2, aluout);
	scc: maincounter port map(counter1, counterload, clk, loadcdata, sc, caryout, tmpclk);
	pcout(4 downto 0) <= std_logic_vector(to_unsigned(intpc, 5));
	pcout(5) <= tmppc(0);
	clkoo <= tmpclk;
	--pcout <= memory(intpc);
	counter1 <= '1';
	--tmppcc <= sc;
	outout <= outflag;
	tmpout <= tmout;
	process(sc, tmpclk) 
	begin
	if(rising_edge(tmpclk))then
		if(flag = 0)then
--		  counter <= '0';
		  counterload <= '1';
		  loadcdata <= "00000000";
		  
			memory(0)<= x"000D";
			memory(1)<= x"800C";
			memory(2)<= x"000D";
			memory(3)<= x"000D";
			memory(4)<= x"000D";
			memory(5)<= x"840C";
			memory(6)<= x"8216";
			memory(7)<= x"8809";
			memory(8)<= x"8215";
			memory(9)<= x"8C09";
			memory(10)<= x"8A34";
			memory(11)<= x"9009";
			memory(12)<= x"C248";
			memory(13)<= x"C4FA";
			memory(14)<= x"C701";
			memory(15)<= x"C809";
			memory(16)<= x"FF28";
			memory(17)<= x"FC0B";
			flag <= 1;
		elsif(sc = "00000000")then
		--	writereg <= '0';
		--	adram <= pc;
			--ir <= outputram;
			--tmppc <= tmppc + "000001";
			counterload <= '0';
			aaa <= aaa+1;
			
			--ir <= memory(conv_integer(pc));
			ir <= memory((intpc));
			
		elsif(sc = "00000001") then
			--unspc <= (to_unsigned(tmppc, 8)) + 1;
			--pc <= std_logic_vector(unspc);
			--intpc <= intpc + 1;
			--pc <= tmppc + "000001";
			if(aaa = 17)then
				tmppc(0) <= '1';
			end if; 
			flag4 <= 1;
			intpc <= intpc + 1;
		elsif(ir(3) = '0') then
			flag5 <= 1;
			if(sc = "00000010")then
				--writereg <= '0';
				--adram <= ir(15 downto 10);
				--op1 <= outputram(3 downto 0);
				op1 <= memory(conv_integer(ir(15 downto 10)))(3 downto 0);
			elsif((sc = "00000011")and(ir(2 downto 0) /= "011"))then
				--writereg <= '0';
				--adram <= ir(9 downto 4);
				--op2 <= outputram(3 downto 0);
				op2 <= memory(conv_integer(ir(9 downto 4)))(3 downto 0);
			elsif(sc = "00000100") then
				alucommand <= ir(2 downto 0);
			elsif(sc = "00000101") then
				ac <= aluout;
			elsif(sc = "00000110") then
				loadcdata <= "00000000";
				counterload <= '1';
			end if;
		elsif(ir(3 downto 0) = "1000")then
			if(sc = "00000010")then
				--writereg <= '0';
				--adram <= ir(15 downto 10);
				--movreg <= outputram;
				movreg <= memory(conv_integer(ir(9 downto 4)));
			elsif(sc = "00000011") then
				
				--adram <= ir(9 downto 4);
				--inputram <= movreg;
				--writereg <= '1';
				memory(conv_integer(ir(15 downto 10))) <= movreg;
			elsif(sc = "00000100")then
				loadcdata <= "00000000";
				counterload <= '1';
			end if;
		elsif(ir(3 downto 0) = "1001")then
			if(sc = "00000010")then
				
				--inputram <= "00000000" & ac;
				--adram <= ir(15 downto 10);
				--writereg <= '1';
				memory(conv_integer(ir(15 downto 10))) <= "00000000" & ac;
			elsif(sc = "00000011")then
				loadcdata <= "00000000";
				counterload <= '1';
			end if;
		elsif(ir(3 downto 0) = "1010")then
			if(sc = "00000010")then
				
				--inputram <= "0000000000" & ir(9 downto 4);
				--adram <= ir(15 downto 10);
				--writereg <= '1';
				memory(conv_integer(ir(15 downto 10))) <= "0000000000" & ir(9 downto 4);
			elsif(sc = "00000011")then
				loadcdata <= "00000000";
				counterload <= '1';
			end if;
		elsif(ir(3 downto 0) = "1011")then
			if(sc = "00000010")then
				--writereg <= '0';
				--adram <= ir(15 downto 10);
				--outp <= outputram;
				outp <= memory(conv_integer(ir(15 downto 10)));
				outflag <= '1';
			elsif(sc = "00000011")then
				loadcdata <= "00000000";
				counterload <= '1';
			end if;
		elsif(ir(3 downto 0) = "1100") then
			if(sc = "00000010")then
				--inputram <= inp;
				--adram <= ir(15 downto 10);
				--writereg <= '1';
				memory(conv_integer(ir(15 downto 10))) <= inp;
			elsif(sc = "00000011")then
				loadcdata <= "00000000";
				counterload <= '1';
			end if;
		elsif(ir(3 downto 0) = "1101") then
			if(sc = "00000010")then
				flag33 <= flag33 + 1;
			
			elsif(sc = "00000011")then
				if(flag33 = 3)then
					tmout <= not tmout;
				end if;
				loadcdata <= "00000000";
				counterload <= '1';
			end if;
		end if;
	end if;
	end process;

end Behavioral;

