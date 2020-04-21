package com.pikachuMVC.exception;

public class ProductStockException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;

	public ProductStockException() {
		super();
	}

	public ProductStockException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public ProductStockException(String message, Throwable cause) {
		super(message, cause);
	}

	public ProductStockException(String message) {
		super(message);
	}

	public ProductStockException(Throwable cause) {
		super(cause);
	}

}
