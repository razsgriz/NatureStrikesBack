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
        tree.GetNode<Sprite2D>("Tree/Sprite2D").Position = new Vector2(50, 50);
        AddChild(tree);
        //GD.Print("Tree should be added");
    }
}