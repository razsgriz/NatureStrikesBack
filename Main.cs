using Godot;
using System;

public partial class Main : Node2D
{

    private Timer _treeSpawn;
    [Export] public int trees { get; set; }
    
    //[Export(PropertyHint.Range, "1,0")]
    
    public override void _Ready()
    {
        _treeSpawn = GetNode<Timer>("TreeSpawner");

        _treeSpawn.Timeout += SpawnTree;

    }

    private void SpawnTree()
    {
        var Children = GetNode<Timer>("TreeSpawner").GetChildren();
        foreach(var child in Children)
        {
            child.QueueFree();
        }
        for (int i = 0; i < 10; i++)
        {
            var treeScene = GD.Load<PackedScene>("res://tree.tscn");
            var tree = treeScene.Instantiate();

            Random skibidi = new Random();
            var treeNode = tree.GetNode<Sprite2D>("Sprite2D");
            treeNode.Position = new Vector2(skibidi.Next(-900, 900), skibidi.Next(-900, 900));
            //treeNode.Position = new Vector2(0, 0);
            GetNode<Timer>("TreeSpawner").AddChild(tree);

            var popupText = new Label();
            popupText.Text = "+50";
            popupText.Scale = new Vector2(8, 8);
            Vector2 vectorChange = new Vector2(100, -350);
            popupText.Position = (treeNode.Position + vectorChange);
            GD.Print(treeNode.Position - popupText.Position);
            treeNode.AddChild(popupText);
        }
    }
}