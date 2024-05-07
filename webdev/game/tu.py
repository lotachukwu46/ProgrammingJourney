import pygame
import copy

# Initialize Pygame
pygame.init()

# Screen dimensions and title
screen_width = 800
screen_height = 800
screen = pygame.display.set_mode((screen_width, screen_height))
pygame.display.set_caption("Chess Game")

# Colors
white = (255, 255, 255)
black = (0, 0, 0)
brown = (185, 122, 87)
yellow = (255, 215, 0)

# Square size and board dimensions
square_size = screen_width // 8
board_rows = 8
board_cols = 8

# Load chess piece images
piece_images = {}
for piece in ("pawn", "rook", "knight", "bishop", "queen", "king"):
  for color in ("white", "black"):
    path = f"images/{color}_{piece}.png"
    piece_images[color + "_" + piece] = pygame.image.load(path)

# Define a piece class
class Piece:
  def __init__(self, row, col, color):
    self.row = row
    self.col = col
    self.color = color
    self.king = False
    self.x = 0
    self.y = 0
    self.calc_pos(row, col)
    self.first_move = True  # Track if piece has made its first move (relevant for castling)

  def calc_pos(self, row, col):
    self.x = square_size * col
    self.y = square_size * row

  def move(self, row, col):
    self.row = row
    self.col = col
    self.calc_pos(row, col)
    self.first_move = False  # Update first_move flag after first move

  def draw(self, screen):
    screen.blit(piece_images[self.color + "_" + self.get_piece_type()], (self.x, self.y))

  def get_piece_type(self):
    return self.__class__.__name__.lower()  # Get piece type from class name

# Define a pawn class (inherits from Piece)
class Pawn(Piece):
  def __init__(self, row, col, color):
    super().__init__(row, col, color)
    self.en_passant_vulnerable = False

  def get_valid_moves(self, board):
    moves = []
    if self.color == "white":
      # Standard white pawn movement
      if self.row - 1 >= 0:
        moves.append((self.row - 1, self.col))
        if self.row == 6 and self.row - 2 >= 0 and board[self.row - 2][self.col] is None:
          moves.append((self.row - 2, self.col))
      # Capture moves
      if self.col - 1 >= 0 and board[self.row - 1][self.col - 1] is not None and board[self.row - 1][self.col - 1].color != self.color:
        moves.append((self.row - 1, self.col - 1))
      if self.col + 1 <= 7 and board[self.row - 1][self.col + 1] is not None and board[self.row - 1][self.col + 1].color != self.color:
        moves.append((self.row - 1, self.col + 1))

      # En passant
      if self.en_passant_vulnerable:
        row, col = self.row, self.col
        if board[row - 1][col + 1] and board[row - 1][col + 1].color == "black" and board[row - 1][col + 1].get_piece_type() == "pawn" and board[row - 1][col + 1].first_move:
          moves.append((row - 1, col + 1))

