function lb {
	echo "$1" | tr ',;' '\n'
}

function lb2 {
	echo "$1" | gsed -r 's/[,;]+/\n/g'
}