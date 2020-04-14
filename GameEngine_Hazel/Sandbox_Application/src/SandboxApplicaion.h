#pragma once

#include "Hazel.h"

class SandboxApplicaion :
	public hazel::Application
{
public:
	SandboxApplicaion();
	virtual ~SandboxApplicaion();
};

hazel::Application* hazel::startApplication() {
	return new SandboxApplicaion();
}