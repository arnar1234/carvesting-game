function cosine_wave(time, period, amplitude, midpoint)
{
    return cos(time * 2 * pi / period) * amplitude + midpoint;
}