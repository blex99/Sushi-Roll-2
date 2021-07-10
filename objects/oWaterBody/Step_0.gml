/// @description sfx, wobble during sushi impact

#region sfx

// if you're nearby
var _col = collision_rectangle(bbox_left - b, bbox_top - b, bbox_right + b,
	bbox_bottom + b, sushi_cur(), 0, 1);
if (_col)
{
	sushi_set_bubbling(0.25, 1000);
}

// if you're closer, play louder
var _b_half = b / 2;
var _col = collision_rectangle(bbox_left - _b_half, bbox_top - _b_half,
	bbox_right + _b_half, bbox_bottom + _b_half, sushi_cur(), 0, 1);
if (_col)
{
	sushi_set_bubbling(1, 1000);
}

#endregion

// calc spring, only if there has been a collision recently...
if (alarm[1] != -1)
{
	for (var i = 0; i <= springCount; i++)
	{
		var _a = -k * springs[i] - d * springsVelocity[i];
	
		springsVelocity[i] += _a;
		springs[i] += springsVelocity[i];
	}

	for (var i = 0; i <= springCount; i++)
	{
		if (i > 0)
		{
			springDeltaL[i] = spread * (springs[i] - springs[i - 1]);
			springsVelocity[i - 1] += springDeltaL[i];
		}
		if (i < springCount)
		{
			springDeltaR[i] = spread * (springs[i] - springs[i + 1]);
			springsVelocity[i + 1] += springDeltaR[i];
		}
	}

	for (var i = 0; i <= springCount; i++)
	{
		if (i > 0)			 springs[i - 1] += springDeltaL[i];
		if (i < springCount) springs[i + 1] += springDeltaR[i];
	}
}

