// The 'blockjack' program.

program blockjack.aleo {

    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }

    struct Table{
        player_1:address,
        player_2:address,
        seed_1:[u8;5],
        seed_2:[u8;5],
        deck:[u8;32],
        bet:u64,
        initializer_ready:bool,
        player_ready:bool
    }

    transition init_game(seed:[u8;5],bet:u64,table:Table) -> Table{
        //TODO transfer coins to initializers wallet to program
        if(table.initializer_ready || table.player_ready ){
            return table;
        }else{
            return Table{
                player_1:self.signer,
                player_2:table.player_2,
                seed_1:seed,
                seed_2:[0u8,0u8,0u8,0u8,0u8,],
                deck:[0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,],
                bet:bet,
                initializer_ready:true,
                player_ready:false,
            };
        }
      
    }
    
    transition join_game(seed:[u8;5],table:Table) -> Table{

        // let arr: [u8;5]=[table.seed_1[0u8],table.seed_1[1u8],table.seed_1[2u8],table.seed_1[3u8],table.seed_1[4u8],]

        // let a: scalar = Keccak256::hash_to_scalar(arr);

    if(table.initializer_ready && table.player_ready){
           return table;
         }else{
        //TODO transfer from player to program necessary bet amount
        //TODO if there is not enough coin fail
        //TODO derive from hash random deck
        
            // let hash: field = BHP256::hash_to_field(table.seed_1,table.seed_2);
           
             return Table{
                 player_1:table.player_1,
                 player_2:self.signer,
                 seed_1:seed,
                 seed_2:[0u8,0u8,0u8,0u8,0u8,],
                 deck:[0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,],
                 bet:table.bet,
                 initializer_ready:true,
                 player_ready:false,
             };
         }
     }

     transition hit(){
        //player gets a card, if total sum is more than 21 initializer wins. transfer rewards to initializer, initialize a new table
        // deck:[1u8,17u8,20u8,40u8,19u8,36u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,],
                //1-13 spades
                //14-26 diamond
                //26-39 club 
                //40-52  hearts

     }

     transition stand(){
        //if player stands compare with initializers card, who get more wins, 
        //if initializer have less than 17 add cards and compare, if more than 21 player wins
        //create a new table
     }
    


    
}
