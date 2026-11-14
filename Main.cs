using Godot;
using System;

public partial class Main : Node2D
{

    private Timer _treeSpawn;
    [Export] public int trees { get; set; } = 1;

    public override void _Ready()
    {
        _treeSpawn = GetNode<Timer>("TreeSpawn");

        _treeSpawn.Timeout += SpawnTree;

    }

    private void SpawnTree()
    {
        Tree tree = treeScene.Instantiate<Tree>();
        AddChild(tree);
    }
}