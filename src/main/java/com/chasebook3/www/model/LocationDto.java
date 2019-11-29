package com.chasebook3.www.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LocationDto {
	//위도, 경도 저장 클래스
	private double lat;
	private double lng;
}