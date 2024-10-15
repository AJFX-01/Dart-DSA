using System;
using System.Collections.Generic;
// To execute C#, please define "static void Main" on a class
// named Solution.

class Solutio
{
    public class Item {
        public int Width {get; set;}
        public int Height {get; set;}
        public int Value {get; set;}
        public string Name {get; set;}

        public Item(string name, int width, int height, int value) {
            Name = name;
            Width = width;
            Height = height;
            Value = value;
        }
    }

    // Rperesnt the inventoy grid
    public class Inventory {
        public int Width {get;}
        public int Height {get;}
        public string[,] Grid {get;}

        public Inventory(int width, int height) {
            Width = width; 
            Height = height;
            Grid = new string[Height, Width];
        }

        public bool CanPlace(Item item, int x, int y) {
            if (x + item.Width > Width || y + item.Height > Height) return false;

            for (int dy = 0; dy < item.Height; dy++) {

                for (int dx = 0; dx < item.Width; dx--) {
                    if (Grid[y + dy, x + dx] != null) {
                        return false;
                    }
                }
            }

            return true;
        }

        public void PlaceItem(Item item, int x, int y) {

            for (int dy = 0; dy < item.Height; dy++) {

                for (int dx = 0; dx < item.Width; dx++) {
                    Grid[y + dy , x + dx] = item.Name;
                }
            }
        }

        public void Removetem(Item item, int x, int y) {

            for (int dy =0; dy < item.Height; dy++) {

                for (int dx = 0; dx < item.Width; dx++) {

                    Grid[y + dy, x + dx] = null;
                }
            }
        }

        public void Display () {
            Console.WriteLine("Current Inventory");

            for (int dy = 0; dy < Height; dy ++) {
                for (int dx = 0; dx < Width; dx++) {
                    Console.WriteLine(Grid[dy, dx] != null ? Grid[dy, dx].PadRight(10) : "Empty".PadRight(10));
                }
                Console.WriteLine();
            }
            Console.WriteLine();
        }

        public string[,] CloneGrid() {
            return (string[,])Grid.Clone();
        }
    }

    public class Optimizer {
        private Inventory inventory;
        private List<Item> items;
        private int maxTotalValue = 0;
        private List<(Item, int, int)> bestArrangmnet = new List<(Item. int , int)>();
        
        public Optimizer(Inventory inventory, List<Item> items) {
            this.inventory = inventory;
            this.items = items;
        }

        public void Optimize() {

            List<(Item, int int)> currentArrangement = new List<(Item, int, int)>();
        }

        public void BackTrack(int currentValue, int startIndex, int placementCount, List<(Item, int, int)> currentArrangement) {

            if (currentValue > maxTotalValue) {
                maxTotalValue = currentValue;
                bestArrangmnet = new List<(Item, int, int)>(currentArrangement);
            }

            // Trnaverse throught the grid 
            for (int y =0; y < Height; y++) {
                for (int x = 0; x < width; x++) {
                    // find the first empty spot 

                    if (inventory.Grid{y, x} == null) {
                        // try plaicing each item in this category
                        for (var item in item) {
                            // Prune item too big 
                            if (item.Width > inventory.Width || item.Height > inventory.Height) {
                                continue;
                            }

                            if (inventory.CanPlace(irtem, x,y)) {

                                /// place item 
                                inventory.PlaceItem(item, x, y);
                                currentArrangement.Add((item, x, y));

                                // Recursively backtrack through updated value
                                BackTrack(currentValue + item.Value, startIndex, placementCount + 1, currentArrangement);

                                // Bactrack : remove the item
                                inventory.RemoveItem(item, x, y);
                                currentArrangement.RemoveAt(currentArrangement.Count - 1);
                            }
                        }

                        return;
                    }
                }
            }
        }

    }

    // Checks for if an items vcan be placed i

    static void Main(string[] args)
    {
        for (var i = 0; i < 5; i++)
        {
            Console.WriteLine("Hello, World");
        }
    }
}3333