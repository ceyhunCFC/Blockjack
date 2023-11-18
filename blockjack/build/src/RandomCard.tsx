import React from 'react';

const RandomCard = () => {
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

 
  return <MyComponent />;
};

export default RandomCard;
