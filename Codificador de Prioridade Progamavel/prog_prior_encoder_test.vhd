library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prog_prior_encoder_test is
    Port ( sw : in STD_LOGIC_VECTOR (10 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0));
end prog_prior_encoder_test;

architecture Behavioral of prog_prior_encoder_test is

begin
  uut: entity work.prog_prior_encoder(behavioral) 
port map (r=>sw(7 downto 0), 
          c=>sw(10 downto 8),
          code=>led(2 downto 0), 
          active=>led(3));
end Behavioral;
