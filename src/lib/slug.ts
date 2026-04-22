export function categorySlug(name: string): string {
	return (
		(name || "uncategorized")
			.toLowerCase()
			.replace(/[^a-z0-9]+/g, "-")
			.replace(/^-+|-+$/g, "") || "uncategorized"
	);
}
