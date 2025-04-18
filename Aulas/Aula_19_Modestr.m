function resultado = modestr(data)


    data = cellstr(data);

    unique_values = unique(data);
    counts = zeros(size(unique_values));
    for i = 1:length(unique_values)
        counts(i) = sum(strcmp(data, unique_values{i}));
    end

    [~, max_idx] = max(counts);
    resultado = unique_values{max_idx};

end

