package com.example.simpleBbs.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name="simpleBbs_tbl")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class SimpleBbs {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bno;
	@Column(length=1000, nullable=false)
	private String content;
	@Column(length=30, nullable=false)
	private String writer;

}
