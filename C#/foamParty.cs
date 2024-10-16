using System;

public class FoamPartyVolumeCalculator
{
    public struct Box
    {
        public float x1, y1, z1;
        public float x2, y2, z2;

        public Box(float x1, float y1, float z1, float x2, float y2, float z2)
        {
            this.x1 = Math.Min(x1, x2);
            this.y1 = Math.Min(y1, y2);
            this.z1 = Math.Min(z1, z2);
            this.x2 = Math.Max(x1, x2);
            this.y2 = Math.Max(y1, y2);
            this.z2 = Math.Max(z1, z2);
        }

        public float Volume()
        {
            return (x2 - x1) * (y2 - y1) * (z2 - z1);
        }
    }

    public static float CalculateOverlap(Box a, Box b)
    {
        float overlapX = Math.Min(a.x2, b.x2) - Math.Max(a.x1, b.x1);
        float overlapY = Math.Min(a.y2, b.y2) - Math.Max(a.y1, b.y1);
        float overlapZ = Math.Min(a.z2, b.z2) - Math.Max(a.z1, b.z1);

        if (overlapX > 0 && overlapY > 0 && overlapZ > 0)
        {
            return overlapX * overlapY * overlapZ;
        }
        return 0;
    }

    public static void Main()
    {
        // Example Garage Dimensions
        float garageWidth = 10.0f;
        float garageLength = 20.0f;
        float garageHeight = 8.0f;

        // Define the two boxes with their corner coordinates
        // Box(Box1): (x1, y1, z1) and (x2, y2, z2)
        Box box1 = new Box(2.0f, 3.0f, 1.0f, 5.0f, 7.0f, 4.0f);
        Box box2 = new Box(4.0f, 5.0f, 2.0f, 8.0f, 9.0f, 6.0f);

        // Calculate volumes
        float garageVolume = garageWidth * garageLength * garageHeight;
        float box1Volume = box1.Volume();
        float box2Volume = box2.Volume();
        float overlapVolume = CalculateOverlap(box1, box2);

        // Calculate available volume
        float availableVolume = garageVolume - (box1Volume + box2Volume - overlapVolume);

        Console.WriteLine($"Garage Volume: {garageVolume} cubic units");
        Console.WriteLine($"Box1 Volume: {box1Volume} cubic units");
        Console.WriteLine($"Box2 Volume: {box2Volume} cubic units");
        Console.WriteLine($"Overlap Volume: {overlapVolume} cubic units");
        Console.WriteLine($"Available Volume for Foam: {availableVolume} cubic units");
    }
}
