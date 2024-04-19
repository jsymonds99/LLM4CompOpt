; ModuleID = 'hw2perf_unoptimized.ll'
source_filename = "hw2perf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000 x i64], align 16
  %2 = alloca [1000 x i64], align 16
  %3 = alloca [1000 x i64], align 16
  %4 = alloca [1000 x i64], align 16
  %scevgep = getelementptr i8, ptr %1, i64 8
  %scevgep16 = getelementptr i8, ptr %2, i64 8
  %scevgep20 = getelementptr i8, ptr %3, i64 8
  %scevgep24 = getelementptr i8, ptr %4, i64 8
  br label %5

5:                                                ; preds = %7, %0
  %lsr.iv28 = phi i64 [ %lsr.iv.next29, %7 ], [ 3, %0 ]
  %lsr.iv11 = phi i64 [ %lsr.iv.next12, %7 ], [ 0, %0 ]
  %lsr.iv = phi i64 [ %lsr.iv.next, %7 ], [ 0, %0 ]
  %tmp = trunc i64 %lsr.iv11 to i32
  %6 = icmp ult i32 %tmp, 1000
  br i1 %6, label %7, label %19

7:                                                ; preds = %5
  %8 = shl nuw nsw i64 %lsr.iv11, 3
  %scevgep13 = getelementptr i8, ptr %scevgep, i64 %8
  %scevgep14 = getelementptr i8, ptr %scevgep13, i64 -8
  store i64 %lsr.iv11, ptr %scevgep14, align 8
  %9 = shl nuw nsw i64 %lsr.iv11, 3
  %scevgep17 = getelementptr i8, ptr %scevgep16, i64 %9
  %scevgep18 = getelementptr i8, ptr %scevgep17, i64 -8
  store i64 %lsr.iv, ptr %scevgep18, align 8
  %10 = add i64 %lsr.iv28, -3
  %11 = shl nuw nsw i64 %lsr.iv11, 3
  %scevgep21 = getelementptr i8, ptr %scevgep20, i64 %11
  %scevgep22 = getelementptr i8, ptr %scevgep21, i64 -8
  store i64 %10, ptr %scevgep22, align 8
  %12 = shl nuw nsw i64 %lsr.iv11, 3
  %scevgep25 = getelementptr i8, ptr %scevgep24, i64 %12
  %scevgep26 = getelementptr i8, ptr %scevgep25, i64 -8
  store i64 0, ptr %scevgep26, align 8
  %13 = add i64 %lsr.iv11, 1
  %14 = shl nuw nsw i64 %lsr.iv11, 3
  %scevgep15 = getelementptr i8, ptr %scevgep, i64 %14
  store i64 %13, ptr %scevgep15, align 8
  %15 = add i64 %lsr.iv, 2
  %16 = shl nuw nsw i64 %lsr.iv11, 3
  %scevgep19 = getelementptr i8, ptr %scevgep16, i64 %16
  store i64 %15, ptr %scevgep19, align 8
  %17 = shl nuw nsw i64 %lsr.iv11, 3
  %scevgep23 = getelementptr i8, ptr %scevgep20, i64 %17
  store i64 %lsr.iv28, ptr %scevgep23, align 8
  %18 = shl nuw nsw i64 %lsr.iv11, 3
  %scevgep27 = getelementptr i8, ptr %scevgep24, i64 %18
  store i64 0, ptr %scevgep27, align 8
  %lsr.iv.next = add nuw nsw i64 %lsr.iv, 4
  %lsr.iv.next12 = add nuw nsw i64 %lsr.iv11, 2
  %lsr.iv.next29 = add nuw nsw i64 %lsr.iv28, 6
  br label %5, !llvm.loop !6

19:                                               ; preds = %5
  call void @srand(i32 noundef 4) #3
  br label %20

20:                                               ; preds = %91, %19
  %.07 = phi i32 [ 15, %19 ], [ %.29, %91 ]
  %.04 = phi i32 [ 5, %19 ], [ %.26, %91 ]
  %.12 = phi i32 [ 0, %19 ], [ %92, %91 ]
  %.0 = phi i32 [ 0, %19 ], [ %.3, %91 ]
  %21 = icmp ult i32 %.12, 1000000000
  br i1 %21, label %22, label %93

22:                                               ; preds = %20
  %23 = sext i32 %.04 to i64
  %24 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %23
  %25 = load i64, ptr %24, align 8
  %26 = mul i64 %25, 87
  %27 = sdiv i64 %26, 4
  %28 = add nsw i64 %27, 23
  %29 = zext i32 %.07 to i64
  %30 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %29
  %31 = load i64, ptr %30, align 8
  %32 = mul i64 %31, 231
  %33 = sdiv i64 %32, 3
  %34 = add nsw i64 %33, 59
  %35 = add nsw i64 %28, %34
  %36 = srem i64 %35, 1000
  %37 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %36
  %38 = load i64, ptr %37, align 8
  %39 = add nsw i64 %38, %25
  %40 = add nsw i64 %39, %31
  %41 = mul nsw i64 %28, 11
  %42 = mul nsw i64 %34, 13
  %43 = add nsw i64 %41, %42
  %44 = mul nsw i64 %40, 17
  %45 = add nsw i64 %43, %44
  %46 = zext i32 %.12 to i64
  %47 = add nsw i64 %45, %46
  %48 = urem i32 %.12, 1000
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %49
  store i64 %47, ptr %50, align 8
  %51 = icmp ult i32 %.12, 100
  br i1 %51, label %52, label %91

52:                                               ; preds = %22, %56
  %lsr.iv30 = phi i64 [ %lsr.iv.next31, %56 ], [ 0, %22 ]
  %.1 = phi i32 [ %spec.select, %56 ], [ %.0, %22 ]
  %53 = udiv i64 %lsr.iv30, 100
  %54 = mul nsw i64 %53, -800
  %scevgep34 = getelementptr i8, ptr %4, i64 %54
  %tmp33 = trunc i64 %lsr.iv30 to i32
  %55 = icmp ult i32 %tmp33, 1000000
  br i1 %55, label %56, label %86

56:                                               ; preds = %52
  %57 = zext i32 %.1 to i64
  %58 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %57
  %59 = load i64, ptr %58, align 8
  %60 = mul nsw i64 %59, 6
  %61 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %57
  %62 = load i64, ptr %61, align 8
  %63 = sdiv i64 %62, 2
  %64 = add nsw i64 %60, %63
  %65 = srem i64 %64, 1000
  %66 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %65
  %67 = load i64, ptr %66, align 8
  %68 = shl nsw i64 %67, 1
  %69 = shl nsw i64 %59, 2
  %70 = add nsw i64 %68, %69
  %71 = srem i64 %70, 1000
  %72 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %71
  %73 = load i64, ptr %72, align 16
  %74 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %57
  %75 = load i64, ptr %74, align 8
  %76 = mul i64 %73, 12
  %77 = add i64 %63, %76
  %78 = mul i64 %59, 10
  %79 = add i64 %77, %78
  %80 = mul i64 %75, 6
  %81 = add i64 %79, %80
  %82 = add i64 %81, %68
  %83 = add i64 %lsr.iv30, %82
  %84 = shl nuw nsw i64 %lsr.iv30, 3
  %scevgep35 = getelementptr i8, ptr %scevgep34, i64 %84
  store i64 %83, ptr %scevgep35, align 8
  %tmp32 = trunc i64 %lsr.iv30 to i32
  %85 = icmp ult i32 %tmp32, 10
  %spec.select = select i1 %85, i32 59, i32 %.1
  %lsr.iv.next31 = add nuw nsw i64 %lsr.iv30, 1
  br label %52, !llvm.loop !8

86:                                               ; preds = %52
  %.1.lcssa = phi i32 [ %.1, %52 ]
  %87 = icmp eq i32 %.12, 0
  br i1 %87, label %88, label %91

88:                                               ; preds = %86
  %89 = call i32 @rand() #3
  %90 = srem i32 %89, 1000
  br label %91

91:                                               ; preds = %88, %86, %22
  %.29 = phi i32 [ %.07, %22 ], [ %.07, %88 ], [ 37, %86 ]
  %.26 = phi i32 [ %.04, %22 ], [ %90, %88 ], [ %.04, %86 ]
  %.3 = phi i32 [ %.0, %22 ], [ %.1.lcssa, %86 ], [ %.1.lcssa, %88 ]
  %92 = add nuw nsw i32 %.12, 1
  br label %20, !llvm.loop !9

93:                                               ; preds = %20, %95
  %lsr.iv36 = phi i64 [ %lsr.iv.next37, %95 ], [ 0, %20 ]
  %tmp39 = trunc i64 %lsr.iv36 to i32
  %94 = icmp ult i32 %tmp39, 1000
  br i1 %94, label %95, label %99

95:                                               ; preds = %93
  %96 = shl nuw nsw i64 %lsr.iv36, 3
  %scevgep38 = getelementptr i8, ptr %4, i64 %96
  %97 = load i64, ptr %scevgep38, align 8
  %98 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %97) #3
  %lsr.iv.next37 = add nuw nsw i64 %lsr.iv36, 1
  br label %93, !llvm.loop !10

99:                                               ; preds = %93
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
