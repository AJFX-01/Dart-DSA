using System;
using System.Collections.Generic;

// To execute C#, please define "static void Main" on a class
// named Solution.

class Solution
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

                for (int dx = 0; dx < item.Width; dx++) {
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

        public void RemoveItem(Item item, int x, int y) {

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
        private List<(Item, int, int )> bestArrangement = new List<(Item, int, int)>();

        public Optimizer(Inventory inventory, List<Item> items) {
            this.inventory = inventory;
            this.items = items;
        }


        public void Optimize () {
            List<(Item, int, int)> currentArrangement = new List<(Item, int ,int)>();
            Backtrack(0, 0, 0, currentArrangement);

            DisplayBestArrangement();
            Console.WriteLine($"Max total value: {maxTotalValue} gold");

        }

        public void Backtrack(int currentValue, int startIndex, int placementCount, List<(Item, int, int)> currentArrangement) {
            // update current if maxium value
            if (currentValue > maxTotalValue) {
                maxTotalValue = currentValue;
                bestArrangement = new List<(Item, int, int)>(currentArrangement); 

            }

            // Tranverse through the grid
            for(int y = 0; y < inventory.Height; y++) {

                for (int x = 0; x < inventory.Width; x++) {

                    if (inventory.Grid[y, x] == null) {
                        foreach(var item in items) {
                            if (item.Width > inventory.Width || item.Height > inventory.Height) {
                                continue;
                            }

                            if (inventory.CanPlace(item, x, y)) {
                                inventory.PlaceItem(item, x, y);
                                currentArrangement.Add((item, x, y));

                                // we recursively bactrack 
                                Backtrack(currentValue + item.Value, startIndex, placementCount + 1, currentArrangement);

                                // we backtrack and remove the item
                                inventory.RemoveItem(item, x, y);
                                currentArrangement.RemoveAt(currentArrangement.Count - 1);
                            }
                        }

                        return;
                    }
                }
            }
        }

        public void DisplayBestArrangement () {

            Inventory tempInventory = new Inventory(inventory.Width, inventory.Height);

            foreach (var (item, x, y) in bestArrangement) {
                tempInventory.PlaceItem(item, x, y);
            }

            tempInventory.Display();
            Console.WriteLine("Best Arrangment");
            foreach (var (item, x, y) in bestArrangement) {
                Console.WriteLine($"{item.Name} placed at (X : {x}, Y : {y}) - Value: {item.Value} gold");
            }

            Console.WriteLine();
        }


    }
    
    static void Main(string[] args)
    {
        int inventoryWidth = 5;
            int inventoryHeight = 4;
            Inventory inventory = new Inventory(inventoryWidth, inventoryHeight);

            // Define items
            List<Item> items = new List<Item>
            {
                new Item("Potion of Potionentiality", 1, 1, 30),
                new Item("Jeweled Dog Draught Excluder", 3, 1, 150),
                new Item("Spartan Shield", 2, 2, 300),
                new Item("Palindromic Sword o’Drows", 1, 3, 120),
                new Item("Unobsidian Armor", 2, 3, 540),
                new Item("Wardrobe of Infinite Lions", 20, 10, 1337) // This item is too big and will be ignored
            };

            // Initialize optimizer
            Optimizer optimizer = new Optimizer(inventory, items);

            // Run optimization
            optimizer.Optimize();
    }
}
