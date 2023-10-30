#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
/**
 * infinite_while - creates an infinite sleep loop
 * Return: Always 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}
/**
 * main - forks new processes to create zombie processes
 * Return: Always 0
 */
int main(void)
{
	int p, p2, p3;

	sleep(2);
	p = fork();
	if (p == 0)
	{
		sleep(2);
		printf("1Zombie process created, PID: %d\n", getpid());
		p2 = fork();
		if (p2 == 0)
			printf("2Zombie process created, PID: %d\n", getpid());
		p2 = fork();
		if (p2 == 0)
			printf("4Zombie process created, PID: %d\n", getpid());
	}
	sleep(2);
	p3 = fork();
	if (p3 == 0)
		printf("3Zombie process created, PID: %d\n", getpid());
	else
	{
		sleep(3);
		/*wait(NULL);*/
		printf("In parent PID = %d\n", p);
		infinite_while();
	}
	return (0);
}
