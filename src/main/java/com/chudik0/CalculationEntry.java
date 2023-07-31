package com.chudik0;
import java.time.LocalDateTime;

public record CalculationEntry(LocalDateTime time, String calculation, int result) {
}