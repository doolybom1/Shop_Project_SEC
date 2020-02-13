package com.biz.shop.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 * @Email : email 형식
 * @NotBlank, @NotNull, @NotEmpty : 공백형식
 * @Null : null일 경우만 통과
 * @Size(max,min)
 * @Max()
 * @Min()
 * @DecimalMax(x) : x 값 이하의 실수
 * @DecimalMin(x) : x 값 이상의 실수
 * @Digits(정수) : 정수 자릿수 검사
 * @Digits(숫자, fraction=y) : 숫자 자릿수 이하이면서 소수점 y자릿수 이하
 *  
 * @Patter(regexp = "\\d{1,15}") : 1부터 15까지의 숫자만 가능
 * 전화번호를 순수 숫자로만 입력받고 싶을때, 전체가 숫자로만 이루어지고 숫자 15자릿수 미만
 * 
 * @Patter(regexp = "\\[30-55]") : 30부터 55까지만 가능
 */


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder

@Entity
@Table(name = "tbl_product" ,schema="emsDB")
public class ProductVO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long p_id;
	
	/*
	 * @NotBlank @NotNull @NotEmpty
	 * 입력값이 공백일 경우 error
	 */
	
	@NotBlank(message = "* 상품코드는 공백이 될 수 없습니다")
	@Size(max = 13, message = "상품코드는 13자리 이하만 가능합니다")
	@Column(name = "p_code", length = 13)
	private String p_code;

	/*
	 * @Size(min, max)
	 * @Maz(13) @Min(13)
	 * 문자열의 길이가 맞지 않을 경우
	 * 
	 * @Email
	 * 문자열이 이메일 형식에 맞지 않을 경우
	 * 
	 * @phoneNumber() : 전화번호 형식 062-111-1111
	 * @Pattern(regexp = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+)
	 */
	@NotBlank(message = "* 상품이름은 공백이 될 수 없습니다")
	@Column(name = "p_name")
	private String p_name;
	
	@Column(name = "p_bcode", length = 5)
	private String p_bcode;
	
	@Column(name = "p_dcode", length = 5)
	private String p_dcode;
	
	@Column(name = "p_iprice")
	private int p_iprice;
	
	@Column(name = "p_oprice")
	private int p_oprice;
	
	@Type(type = "text")
	@Column(name = "p_detail", length = 2000)
	private String p_detail;
}
