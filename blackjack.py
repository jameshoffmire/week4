from random import randrange

class deck():

    def __init__(self):
        deck_ = []
        for rank in ['1','2','3','4','5','6','7','8','9','10','J','Q','K','A']:
            for suit in ['Clubs','Spades','Hearts','Diamonds']:
                deck_.append((rank,suit))
        self.deck_ = deck_

    def draw(self):
        if not self.deck_:
            print('deck is empty')
            return
        return self.deck_.pop(randrange(len(self.deck_)))

    def __len__(self):
        return len(self.deck_)

class game():

    def __init__(self):
        self.deck = deck()

    def print_cards(self, cards):
        result = ''
        for card in cards:
            result += f'  [{card[0]} of {card[1]}]  '
        print(result)


    
