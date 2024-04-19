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
  br label %5

5:                                                ; preds = %7, %0
  %.01 = phi i32 [ 0, %0 ], [ %17, %7 ]
  %6 = icmp ult i32 %.01, 1000
  br i1 %6, label %7, label %18

7:                                                ; preds = %5
  %8 = zext i32 %.01 to i64
  %9 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %8
  store i64 %8, ptr %9, align 8
  %10 = shl nuw nsw i32 %.01, 1
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %8
  store i64 %11, ptr %12, align 8
  %13 = mul nsw i32 %.01, 3
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %8
  store i64 %14, ptr %15, align 8
  %16 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %8
  store i64 0, ptr %16, align 8
  %17 = add nuw nsw i32 %.01, 1
  br label %5, !llvm.loop !6

18:                                               ; preds = %5
  call void @srand(i32 noundef 4) #3
  br label %19

19:                                               ; preds = %90, %18
  %.07 = phi i32 [ 15, %18 ], [ %.29, %90 ]
  %.04 = phi i32 [ 5, %18 ], [ %.26, %90 ]
  %.12 = phi i32 [ 0, %18 ], [ %91, %90 ]
  %.0 = phi i32 [ 0, %18 ], [ %.3, %90 ]
  %20 = icmp ult i32 %.12, 1000000000
  br i1 %20, label %21, label %92

21:                                               ; preds = %19
  %22 = sext i32 %.04 to i64
  %23 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %22
  %24 = load i64, ptr %23, align 8
  %25 = mul i64 %24, 87
  %26 = sdiv i64 %25, 4
  %27 = add nsw i64 %26, 23
  %28 = zext i32 %.07 to i64
  %29 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %28
  %30 = load i64, ptr %29, align 8
  %31 = mul i64 %30, 231
  %32 = sdiv i64 %31, 3
  %33 = add nsw i64 %32, 59
  %34 = add nsw i64 %27, %33
  %35 = srem i64 %34, 1000
  %36 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %35
  %37 = load i64, ptr %36, align 8
  %38 = add nsw i64 %37, %24
  %39 = add nsw i64 %38, %30
  %40 = mul nsw i64 %27, 11
  %41 = mul nsw i64 %33, 13
  %42 = add nsw i64 %40, %41
  %43 = mul nsw i64 %39, 17
  %44 = add nsw i64 %42, %43
  %45 = zext i32 %.12 to i64
  %46 = add nsw i64 %44, %45
  %47 = urem i32 %.12, 1000
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %48
  store i64 %46, ptr %49, align 8
  %50 = icmp ult i32 %.12, 100
  br i1 %50, label %51, label %90

51:                                               ; preds = %21, %55
  %lsr.iv = phi i64 [ %lsr.iv.next, %55 ], [ 0, %21 ]
  %.1 = phi i32 [ %spec.select, %55 ], [ %.0, %21 ]
  %52 = udiv i64 %lsr.iv, 100
  %53 = mul nsw i64 %52, -800
  %scevgep = getelementptr i8, ptr %4, i64 %53
  %tmp11 = trunc i64 %lsr.iv to i32
  %54 = icmp ult i32 %tmp11, 1000000
  br i1 %54, label %55, label %85

55:                                               ; preds = %51
  %56 = zext i32 %.1 to i64
  %57 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %56
  %58 = load i64, ptr %57, align 8
  %59 = mul nsw i64 %58, 6
  %60 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %56
  %61 = load i64, ptr %60, align 8
  %62 = sdiv i64 %61, 2
  %63 = add nsw i64 %59, %62
  %64 = srem i64 %63, 1000
  %65 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %64
  %66 = load i64, ptr %65, align 8
  %67 = shl nsw i64 %66, 1
  %68 = shl nsw i64 %58, 2
  %69 = add nsw i64 %67, %68
  %70 = srem i64 %69, 1000
  %71 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %70
  %72 = load i64, ptr %71, align 16
  %73 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %56
  %74 = load i64, ptr %73, align 8
  %75 = mul i64 %72, 12
  %76 = add i64 %62, %75
  %77 = mul i64 %58, 10
  %78 = add i64 %76, %77
  %79 = mul i64 %74, 6
  %80 = add i64 %78, %79
  %81 = add i64 %80, %67
  %82 = add i64 %lsr.iv, %81
  %83 = shl nuw nsw i64 %lsr.iv, 3
  %scevgep12 = getelementptr i8, ptr %scevgep, i64 %83
  store i64 %82, ptr %scevgep12, align 8
  %tmp = trunc i64 %lsr.iv to i32
  %84 = icmp ult i32 %tmp, 10
  %spec.select = select i1 %84, i32 59, i32 %.1
  %lsr.iv.next = add nuw nsw i64 %lsr.iv, 1
  br label %51, !llvm.loop !8

85:                                               ; preds = %51
  %.1.lcssa = phi i32 [ %.1, %51 ]
  %86 = icmp eq i32 %.12, 0
  br i1 %86, label %87, label %90

87:                                               ; preds = %85
  %88 = call i32 @rand() #3
  %89 = srem i32 %88, 1000
  br label %90

90:                                               ; preds = %87, %85, %21
  %.29 = phi i32 [ %.07, %21 ], [ %.07, %87 ], [ 37, %85 ]
  %.26 = phi i32 [ %.04, %21 ], [ %89, %87 ], [ %.04, %85 ]
  %.3 = phi i32 [ %.0, %21 ], [ %.1.lcssa, %85 ], [ %.1.lcssa, %87 ]
  %91 = add nuw nsw i32 %.12, 1
  br label %19, !llvm.loop !9

92:                                               ; preds = %19, %94
  %lsr.iv13 = phi i64 [ %lsr.iv.next14, %94 ], [ 0, %19 ]
  %tmp16 = trunc i64 %lsr.iv13 to i32
  %93 = icmp ult i32 %tmp16, 1000
  br i1 %93, label %94, label %98

94:                                               ; preds = %92
  %95 = shl nuw nsw i64 %lsr.iv13, 3
  %scevgep15 = getelementptr i8, ptr %4, i64 %95
  %96 = load i64, ptr %scevgep15, align 8
  %97 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %96) #3
  %lsr.iv.next14 = add nuw nsw i64 %lsr.iv13, 1
  br label %92, !llvm.loop !10

98:                                               ; preds = %92
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
