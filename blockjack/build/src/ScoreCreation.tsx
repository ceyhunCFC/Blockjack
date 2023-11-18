import Button from "@mui/material/Button";
import CssBaseline from "@mui/material/CssBaseline";
import TextField from "@mui/material/TextField";
import Box from "@mui/material/Box";
import Typography from "@mui/material/Typography";
import Container from "@mui/material/Container";
import { getUserMappingId } from "./db";
import { Page } from "./utils";
import { FC, useState } from "react";
import { workerClient } from "./worker-client";
import imageSrc from '/Users/ceyhun_cfc/Desktop/Project/zkleaderboard-aleo/client/public/Cards/4.png';

interface Props {
  setPage: (page: Page) => void;
}


export const ScoreCreationPage: FC<Props> = ({ setPage }) => {
  const [isLoading, setIsLoading] = useState(false);

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    setIsLoading(true);
    try {
      const data = new FormData(event.currentTarget);
      const un = data.get("username");
      const sc = data.get("score");

      if (!un || !sc) throw new Error("Missing inputs");

      const username = un.toString();
      const score = parseInt(sc.toString());

      const mappingId = getUserMappingId(username);
      await workerClient.updateScore({ userId: mappingId, score });

      console.log(`${username} stored with id ${mappingId}`);
    } catch (error) {
      console.error("On submit error:", error);
    }
    setIsLoading(false);
  };

  interface Card {
    suit: string;
    rank: string;
  }

  // generate deck is create arrays for a deck of cards
  const generateDeck = (): Card[] => {
    const suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades'];
    const ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'];

    const deck: Card[] = [];

    for (const suit of suits) {
      for (const rank of ranks) {
        deck.push({ suit, rank });
      }
    }

    return deck;
  };

  // getting a random card from generateDeck
  const getRandomCard = (deck: Card[]): Card => {
    const randomIndex = Math.floor(Math.random() * deck.length);
    return deck[randomIndex];
  };

  // create a component for printing to the screen
  const MyComponent: React.FC = () => {
    const deck = generateDeck();
    const randomCard = getRandomCard(deck);

    return (
      <div>
        {/* <h2>Your Cards</h2> */}
        <p>Suit: {randomCard.suit}</p>
        <p>Rank: {randomCard.rank}</p>
        
      </div>
    );
  };
  


  return (
    <Container component="main" maxWidth="xs">

        <MyComponent></MyComponent>
      
        
      <CssBaseline />

  
      <Box
        sx={{
          
          marginTop: 8,
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
        }}
      >
         
        <Typography component="h1" variant="h5">
          {isLoading
            ? "Submitting user score. This should take about 3 minutes."
            : "Create user score"}
        </Typography>

        <Box component="form" onSubmit={handleSubmit} noValidate sx={{ mt: 1 }}>
          <TextField
            margin="normal"
            required
            fullWidth
            id="username"
            label="Username"
            name="username"
            autoFocus
            disabled={isLoading}
          />

          <TextField
            margin="normal"
            required
            fullWidth
            name="score"
            label="Score"
            type="number"
            id="score"
            disabled={isLoading}
          />
          

         
          <Button
            type="submit"
            fullWidth
            variant="contained"
            sx={{ mt: 3, mb: 2 }}
            disabled={isLoading}
          >
            Submit Score
          </Button>

          <Button
            disabled={isLoading}
            fullWidth
            variant="contained"
            onClick={() => setPage("leaderboard")}
          >
            Leaderboard
          </Button>
          
          
          <Button 
            
            fullWidth
            variant="contained"
            sx={{ mt: 3, mb: 2 }}
            disabled={isLoading}
            
          >
            Get Cards
          </Button>

          <Button
          variant="contained"
          color="primary"
          style={{
            position: 'fixed',
            bottom: 50,
            right: 50,
            width: '128px', // Set the width to make it square
            height: '128px', // Set the height to make it square
            borderRadius: '0', // Set border radius to make it square
          }}
        >
          HIT
        </Button>


        <Button
          variant="contained"
          color="primary"
          style={{
            position: 'fixed',
            bottom: 50,
            left: 50,
            width: '128px', // Set the width to make it square
            height: '128px', // Set the height to make it square
            borderRadius: '0', // Set border radius to make it square
          }}
        >
          STAND
        </Button>

          <div>
                <img src={imageSrc} alt="Example" style={{
              position: 'fixed',
              bottom: 50,
              left: 500,
              width: '169px', // Adjust the width as needed
              height: '223px', // Adjust the height as needed
            }} />
          </div>

          <div>
                <img src={imageSrc} alt="Example" style={{
              position: 'fixed',
              bottom: 50,
              left: 750,
              width: '169px', // Adjust the width as needed
              height: '223px', // Adjust the height as needed
            }} />
          </div>


          <div>
                <img src={imageSrc} alt="Example" style={{
              position: 'fixed',
              top: 50,
              left: 500,
              width: '169px', // Adjust the width as needed
              height: '223px', // Adjust the height as needed
            }} />
          </div>

          <div>
                <img src={imageSrc} alt="Example" style={{
              position: 'fixed',
              top: 50,
              left: 750,
              width: '169px', // Adjust the width as needed
              height: '223px', // Adjust the height as needed
            }} />
          </div>
           


        </Box>
      </Box>
    </Container>
  );
};