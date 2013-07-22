/*
 * Copyright (C) 2012 Andrew Oliver
 *
 * This file is part of the Roman Numerals Library.
 *
 * The Roman Numerals Library is free software: you can redistribute
 * it and/or modify it under the terms of the GNU Affero General
 * Public License as published by the Free Software Foundation, either
 * version 3 of the License, or (at your option) any later version.

 * The Roman Numerals Library is distributed in the hope that it will
 * be useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU Affero General Public License for more details.

 * You should have received a copy of the GNU Affero General Public
 * License along with the Roman Numerals Library.  If not, see
 * <http://www.gnu.org/licenses/>.
 */
package com.frequal.romannumerals;


import java.io.IOException;
import java.text.ParseException;


public class Main {
    private static Converter converter = new Converter();

    public static void main(String[] astrArgs) throws IOException, ParseException {
        int numberToConvert = -1;

        try {
            numberToConvert = Integer.parseInt(astrArgs[0]);
        } catch (NumberFormatException nfx) {
            numberToConvert = -1;
        }

        if (numberToConvert != -1) {
            System.out.println(astrArgs[0] + " in Roman numerals: " + converter.toRomanNumerals(numberToConvert));
        } else {
            System.out.println(astrArgs[0] + " as a number: " + converter.toNumber(astrArgs[0]));
        }
    }
}
