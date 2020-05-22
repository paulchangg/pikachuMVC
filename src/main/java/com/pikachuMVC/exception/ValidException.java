package com.pikachuMVC.exception;

public class ValidException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	
	public ValidException() {
		super();
	}

	public ValidException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public ValidException(String message, Throwable cause) {
		super(message, cause);
	}

	public ValidException(String message) {
		super(message);
	}

	public ValidException(Throwable cause) {
		super(cause);
	}

}
