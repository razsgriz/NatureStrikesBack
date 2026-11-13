using Godot;
using System;

public partial class Tree : Node2D
{
	[Signal]
	public delegate void CaughtEventHandler();
	[Export] public int trees { get; set; } = 1;
	public override void _Ready()
	{
		AddToGroup("trees");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	
}
