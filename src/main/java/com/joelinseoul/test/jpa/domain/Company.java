package com.joelinseoul.test.jpa.domain;

import java.time.ZonedDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder=true)
@Getter
@Setter
@Table(name="company_info")
@Entity
public class Company {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String business;
	
	private String scale;
	
	private int headcount;
	
	@UpdateTimestamp
	@Column(name="createdAt", updatable=false)
	private ZonedDateTime createdAt;
	
	@UpdateTimestamp
	@Column(name="updatedAt")
	private ZonedDateTime updatedAt;

}
