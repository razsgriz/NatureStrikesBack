using Godot;
using System;

public partial class Main : Node2D
{

    private Timer _treeSpawn;
    [Export] public int trees { get; set; }
    
    //[Export(PropertyHint.Range, "1,0")]
    
    public override void _Ready()
    {
        _treeSpawn = GetNode<Timer>("TreeSpawn");

        _treeSpawn.Timeout += SpawnTree;

    }

    private void SpawnTree()
    {
        var treeScene = GD.Load<PackedScene>("res://tree.tscn");
        var tree = treeScene.Instantiate();

        Random skibidi = new Random();
        tree.GetNode<Sprite2D>("Sprite2D").Position = new Vector2(skibidi.Next(-900, 900), skibidi.Next(-900, 900));
        AddChild(tree);
    }
}