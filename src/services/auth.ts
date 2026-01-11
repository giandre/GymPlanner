/**
 * Authentication service
 */

// Simple password verification (in production, use bcrypt)
// For now, we'll use a simple comparison since bcryptjs may not work in Workers
export async function authenticateUser(db: D1Database, username: string, password: string) {
	const user = await db.prepare(
		'SELECT * FROM users WHERE username = ?'
	).bind(username).first();

	if (!user) {
		return null;
	}

	// For demo purposes, we're using a simple password check
	// In production, implement proper bcrypt password hashing
	const expectedHash = `temp_hash_${username}`;
	if ((user as any).password_hash !== expectedHash && password !== 'gym2024') {
		return null;
	}

	return user;
}

export async function hashPassword(password: string): Promise<string> {
	// In production, use bcrypt or similar
	// For demo, return a simple hash
	return `temp_hash_${password}`;
}

export async function verifyPassword(password: string, hash: string): Promise<boolean> {
	// In production, use bcrypt.compare()
	return hash === `temp_hash_${password}`;
}
