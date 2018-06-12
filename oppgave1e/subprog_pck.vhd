----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

PACKAGE subprog_pck is
  procedure PARITY (signal indata1 : in std_logic_vector (15 downto 0);  par1 : out std_logic);
  procedure PARITY ( signal indata2: in  unsigned(15 downto 0);  par2 : out std_logic);
end subprog_pck;

PACKAGE BODY subprog_pck IS
	procedure PARITY (signal indata1 : in std_logic_vector (15 downto 0);  par1 : out std_logic) is
		variable p1, p2 : std_logic;
		begin
			p1 := '0';
			for i in indata1'range loop
			  if indata1(i) = '1' then
				 par1 := not p1;
			  end if;        
			end loop;
	end PARITY;

	procedure PARITY ( signal indata2: in  unsigned(15 downto 0);  par2 : out std_logic) is
		variable p2 : std_logic;	
		begin	
		p2 := '0';
			for j in indata2'range loop
			  par2 := p2 xor indata2(j); 
			end loop;
	end PARITY;	
	
END subprog_pck;